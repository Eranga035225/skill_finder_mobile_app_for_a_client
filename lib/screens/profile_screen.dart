import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('Service Provider', style: TextStyle(color: Colors.black,  fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),

   body: Column(
     children: [
       Align(
        alignment: Alignment.topCenter,
         child: Column(
             // push content to top
           crossAxisAlignment: CrossAxisAlignment.center, // center horizontally
           children: [
            SizedBox(height: 20),
             CircleAvatar(
               radius: 80,
               backgroundImage: AssetImage('assets/images/profile_icon.png'),
             ),
             SizedBox(height: 20),
             Text(
               'Etahn Carter',
               style: TextStyle(
                 color: Colors.black,
                 fontSize: 27,
                 fontWeight: FontWeight.w500,
               ),
             ),
             Text('Electrician', style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
             ),),
             Text('5 years of experience', style: TextStyle(
              color: Colors.grey,
              fontSize: 18,
             ),),
           ],
         ),
       ),




       
     ],
   ),
   







    );
  }
}