import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 3, 151, 151),
       body: 
       Center(
         child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
            
            Text('Skill Finder', style:TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold
            ))
             
           ],
         ),
       )
     






    );
  }
}