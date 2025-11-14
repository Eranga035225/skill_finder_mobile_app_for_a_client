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
      backgroundColor: Colors.white,
      body:
      Column(
        children: [
          Image(image: AssetImage('assets/images/homescreen.png', ),fit:BoxFit.fitWidth,
          width:double.infinity ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:0, vertical:8),
            child: Column(
              children: [
                Text('Find and hire local service providers', 
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  
                ),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text('Connect with skilled professionals for all your home service needs', 
            style:TextStyle(color:Colors.grey.shade800,
            fontSize: 17
            ),
            textAlign: TextAlign.center,),
          )

          
          
          
      
        ],
        
      
      )

    );
  }
}