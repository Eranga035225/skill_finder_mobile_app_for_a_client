import 'package:flutter/material.dart';

import '../utils/categories.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size; 
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: 
      [
        BottomNavigationBarItem(icon: Icon(Icons.home), label:'Categories' ),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label:'Bookings' ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label:'Profile' ),

      ]


      
      
      ),

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Categories', style:TextStyle(fontWeight: FontWeight.w400)),
        centerTitle: true,
        


      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 20),
        child: GridView.builder(

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3, 
            mainAxisSpacing: 14,      // vertical spacing
            crossAxisSpacing: 14,  
            ),
          itemCount:Categories.categories.length,
          itemBuilder: (context, index){
          final category = Categories.categories[index];

            return Container(
            width: size.width *0.35,
            height:2,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              )
           ),
           child: Center(child: 
           Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              category.icon,
              SizedBox(width: 10,),
              Text(category.type, style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),)


          
            ],
           
        
           ),)
     
        );
          }
            ),
      )
    );
  }
}