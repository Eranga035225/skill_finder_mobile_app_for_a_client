import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skill_finder/models/service_provider_model.dart';

import '../components/custom_button.dart';
import '../utils/custom_colors.dart';
import 'profile_screen.dart';

class BookingScreen extends StatefulWidget {
  final ServiceProviderModel provider;
  const BookingScreen({super.key, required this.provider});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
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
        title: Text(
          ' Confirm Booking',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Service',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),

                child: Center(
                  child: FaIcon(FontAwesomeIcons.fan, color: Colors.black),
                ),
              ),
              title: Text(
                'Ceiling Fan Installation',
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                'Install a new ceiling fan',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            SizedBox(height: 20),

            Text(
              'Provider',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/profile_icon.png'),
              ),
              title: Text(
                widget.provider.name,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: Text(
                '${widget.provider.initialRating} ★',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Date & Time',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Tue, Jul 23 - 10.00AM - 11.00AM',
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Summary',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Text(
                  'Service',
                  style: TextStyle(color: CustomColors.primaryColor),
                ),
                Spacer(),
                Text('Ceiling Fan Installation'),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  'Subtotal',
                  style: TextStyle(color: CustomColors.primaryColor),
                ),
                Spacer(),
                Text('\$120'),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  'Taxes',
                  style: TextStyle(color: CustomColors.primaryColor),
                ),
                Spacer(),
                Text('\$12'),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text(
                  'Total',
                  style: TextStyle(color: CustomColors.primaryColor),
                ),
                Spacer(),
                Text('\$132'),
              ],
            ),

            SizedBox(height: 90),
            CustomButton(
              onTap: () {},
              buttonColor: CustomColors.primaryColor,
              text: 'Confirm Booking',
              textSize: 18,
              width: double.infinity,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
