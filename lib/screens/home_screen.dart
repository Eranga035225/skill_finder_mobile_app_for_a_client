import 'package:flutter/material.dart';
import 'package:skill_finder/screens/categories_screen.dart';

import '../components/custom_button.dart';
import '../utils/custom_colors.dart';

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
            padding: const EdgeInsets.symmetric(horizontal:15, vertical:8),
            child: Column(
              children: [
                Text('Find and hire local service providers', 
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  
                ),),
                SizedBox(height:20),
                Text('Connect with skilled professionals for all your home service needs', 
                    style:TextStyle(color:const Color.fromARGB(255, 12, 4, 4),
                    fontSize: 17
                    ),
                    textAlign: TextAlign.center,),
                SizedBox(height:20),
                GestureDetector(
                  onTap: (){
                   

                  },
                  child: CustomButton(buttonColor: CustomColors.primaryColor,text:'Sign Up')),
                SizedBox(height:15),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesScreen(),));

                  },
                  child: CustomButton(buttonColor: Colors.grey.shade200, text: 'Log in')),
                SizedBox(height:200),
                
                Text('By continuing you agree to our Terms of Service and Privacy Policy', style:TextStyle(color:Colors.grey.shade600),
                textAlign: TextAlign.center,)  
                    
                        ],
                      ),
                    ),
                
                

          
          
          
      
        ],
        
      
      )

    );
  }
}

