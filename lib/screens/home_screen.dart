import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(
        children: [
          Image(image: AssetImage('assets/images/homescreen.png', ),fit:BoxFit.fitWidth,
          width:double.infinity ),
          Text('Find and Hire local service Providers', style: TextStyle(
            color: Colors.black
          ),),
          Text('Connect with skilled professionals for all your home service needs', style:TextStyle(color:Colors.black))
          
          
          
      
        ],
        
      
      )

    );
  }
}