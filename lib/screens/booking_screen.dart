import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text(' Confirm Booking'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
        
            Text('Service', style:TextStyle(
              color:Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
        
            )),
            ListTile(
              leading: Container(
                width:60,
                height:60,
                decoration:BoxDecoration(
                  color:Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8)
                ),
                
                child: Center(child: FaIcon(FontAwesomeIcons.fan, color: Colors.grey,))),
              title: Text('Ceiling Fan Installation'),
              subtitle: Text('Install a new ceiling fan'),
                  
            ),
        
            SizedBox(height:20,),
        
            Text('Provider', style:TextStyle(
              color:Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
        
            )),
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/profile_icon.png', ),
        
              ),
              title: Text('Ethan Carter'),
              subtitle: Text('4.9(123 reviews)'),
        
            ),
            SizedBox(height:20,),
            Text('Date & Time', style:TextStyle(
              color:Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold
        
            )), 


           
        
        
          ]
        
        
        
        
        
        
         ,),
      )
      












    );
  }
}