import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
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

      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 10,
        itemBuilder: (context, index)=> Container(
          



         )



      







    
      )
    );
  }
}