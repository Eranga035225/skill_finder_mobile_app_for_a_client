import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/web.dart';
import 'package:skill_finder/components/custom_button.dart';
import 'package:skill_finder/models/service_provider_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/portfolio_model.dart';
import '../utils/custom_colors.dart';
import '../utils/portfolio.dart';
import 'booking_screen.dart';
// import 'package:skill_finder/utils/portfolio.dart';

class ProfileScreen extends StatefulWidget {
  final ServiceProviderModel provider;
  const ProfileScreen({super.key, required this.provider});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<void> _openWhatsAppChat() async {
    String rawPhone = widget.provider.contactNumber.trim();

    if (rawPhone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No phone number available')),
      );
      return;
    }

    // Clean to digits only
    rawPhone = rawPhone.replaceAll(RegExp(r'\D'), '');

    // Auto-convert Sri Lankan numbers starting with 0
    String phone;
    if (rawPhone.startsWith('0')) {
      phone = '94' + rawPhone.substring(1); // 0761234567 → 94761234567
    } else {
      phone = rawPhone; // Already in correct format
    }

    final uri = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: phone,
      queryParameters: {
        'text': 'Hi ${widget.provider.name}, I found you on Skill Finder.',
      },
    );

    Logger().d('Launching WhatsApp URL: $uri');

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Could not open WhatsApp')));
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Categories'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(onTap: () {}, child: Icon(Icons.person)),
            label: 'Profile',
          ),
        ],
      ),

      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          'Service Provider',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  // push content to top
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // center horizontally
                  children: [
                    SizedBox(height: 20),
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(
                        'assets/images/profile_icon.png',
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.provider.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.provider.category ?? '',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        // fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '${widget.provider.yearsOfExperience} years of experience',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Section1(
                email: widget.provider.email,
                phone: widget.provider.contactNumber,
              ), //contact section
              Section2(), // services section
              Portfolio_Section(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CustomButton(
                  onTap: _openWhatsAppChat,
                  buttonColor: Colors.grey.shade200,
                  text: 'Message',
                  textSize: 16,
                  width: double.infinity,
                  height: 45,
                ),
              ),
              SizedBox(height: 15),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: CustomButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BookingScreen(provider: widget.provider),
                      ),
                    );
                  },
                  buttonColor: CustomColors.primaryColor,
                  text: 'Book Now',
                  textSize: 16,
                  width: double.infinity,
                  height: 45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Portfolio_Section extends StatelessWidget {
  const Portfolio_Section({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Portfolio',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 13),
          SizedBox(
            height: 220, //
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Portfolio.items.length,
              itemBuilder: (context, index) {
                PortfolioModel portfolio = Portfolio.items[index];

                return Container(
                  width: 180,
                  margin: EdgeInsets.only(right: 16),
                  child: Card(
                    color: Colors.white, // 👈 white background
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                          child: Image.asset(
                            portfolio.imageUrl,
                            height: 140, // 👈 reduced image height
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white, // 👈 title area white
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(16),
                            ),
                          ),
                          child: Text(
                            portfolio.title,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Section1 extends StatelessWidget {
  final String email;
  final String phone;
  const Section1({super.key, required this.email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              'Contact',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 10),
            ListItem(
              title: 'Email',
              subtitle: email,
              icon: FaIcon(FontAwesomeIcons.envelope),
            ),
            ListItem(
              title: 'Phone',
              subtitle: phone,
              icon: FaIcon(FontAwesomeIcons.phone),
            ),
          ],
        ),
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              'Services',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 13),
            ListItem(
              title: 'Electrical Wiring',
              icon: FaIcon(FontAwesomeIcons.boltLightning),
            ),
            ListItem(
              title: 'Appliance Installation',
              icon: FaIcon(FontAwesomeIcons.plug),
            ),
            ListItem(
              title: 'Lighting Repair',
              icon: FaIcon(FontAwesomeIcons.lightbulb),
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final String? subtitle; // nullable
  final FaIcon icon;

  ListItem({
    super.key,
    required this.title,
    this.subtitle, // not required
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: icon),
      ),

      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),

      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w300,
              ),
            )
          : null, // if no subtitle → ListTile removes this area automatically
    );
  }
}
