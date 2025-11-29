import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/web.dart';
import 'package:skill_finder/models/service_provider_model.dart';

import '../components/custom_button.dart';
import '../utils/custom_colors.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class BookingScreen extends StatefulWidget {
  final ServiceProviderModel provider;
  const BookingScreen({super.key, required this.provider});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  Future<void> _sendBookingEmailViaEmailJS() async {
    // EmailJS config (replace with your real IDs)
    const serviceId = 'service_sapx0bx';
    const templateId = 'template_qx4vyth';
    const publicKey = 'Nc3FVqDNjxM8p7MV0'; // sometimes called user_id

    // Get logged-in user's email (customer)
    final currentUser = FirebaseAuth.instance.currentUser;
    final userEmail = currentUser?.email ?? 'unknown@user.com';
    final userName = currentUser?.displayName ?? 'Valued Customer';

    // These details can later come from real booking data
    const serviceName = 'Ceiling Fan Installation';
    const dateTime = 'Tue, Jul 23 - 10.00AM - 11.00AM';
    const total = '\$132';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    final payload = {
      'service_id': serviceId,
      'template_id': templateId,
      'user_id': publicKey,
      'template_params': {
        'to_email': widget.provider.email,
        'to_name': widget.provider.name,
        'user_email': userEmail,
        'user_name': userName,
        'service': serviceName,
        'date_time': dateTime,
        'total': total,
      },
    };

    Logger().i('Sending booking email via EmailJS: $payload');

    try {
      final response = await http.post(
        url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(payload),
      );

      if (response.statusCode == 200) {
        Logger().i('✅ EmailJS: booking email sent successfully');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('✅ Booking email sent to provider')),
          );
        }
      } else {
        Logger().e('❌ EmailJS error: ${response.statusCode} ${response.body}');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('❌ Failed to send email. Please try again.'),
            ),
          );
        }
      }
    } catch (e) {
      Logger().e('❌ EmailJS exception: $e');
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error sending email: $e')));
      }
    }
  }

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
              onTap: () async {
                Logger().f('Booking Confirmed – sending email via EmailJS');
                await _sendBookingEmailViaEmailJS();
              },
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
