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
      SafeArea(
        child: Column(
          children: [
            Image(image: AssetImage('homescreen.png')),
            
            Text('Find and Hire local service Providers', style: TextStyle(
              color: Colors.black
            ),),
            Text('Connect with skilled professionals for all your home service needs', style:TextStyle(color:Colors.black))
            
            
            
        
          ],
          
        
        ),
      )

    );
  }
}