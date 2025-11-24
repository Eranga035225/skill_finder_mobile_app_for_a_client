import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skill_finder/components/custom_button.dart';

import '../models/portfolio_model.dart';
import '../utils/custom_colors.dart';
import '../utils/portfolio.dart';
// import 'package:skill_finder/utils/portfolio.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
 
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: 
      [
        BottomNavigationBarItem(icon: Icon(Icons.home), label:'Categories' ),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label:'Bookings' ),
        BottomNavigationBarItem(icon: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
          },
          
          
          child: Icon(Icons.person)), label:'Profile' ),

      ]


      
      
      ),

      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('Service Provider', style: TextStyle(color: Colors.black,  fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),

   body: SingleChildScrollView(
     child: Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                     fontSize: 30,
                     fontWeight: FontWeight.w500,
                   ),
                 ),
                 Text('Electrician', style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  // fontWeight: FontWeight.w600,
                 ),),
                 Text('5 years of experience', style: TextStyle(
                   color: Colors.grey.shade600,
                  fontSize: 18,
                 fontWeight: FontWeight.w300,
                 ),),
               ],
             ),
           ),
           SizedBox(height:20),
           Section1(), //contact section
           Section2(), // services section
           Portfolio_Section(),
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              CustomButton(buttonColor: Colors.grey.shade200, text: 'Message', height: 30, width: 110, textSize: 16,),
             
              CustomButton(buttonColor:CustomColors.primaryColor.withAlpha(20), text: 'Book Now', height: 30, width: 110, textSize: 16,),
             
             
             ],),
           )






          
           
        
       
          
       
       
       
       
       
         ],
       ),
     ),
   ),
   







    );
  }
}

class Portfolio_Section extends StatelessWidget {
  const Portfolio_Section({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Portfolio', style:TextStyle(
           color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          
          )),
         SizedBox(height:13),
      SizedBox(
               height: 220, // 
               child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 itemCount: Portfolio.items.length,
                 itemBuilder: (context, index) {
                   PortfolioModel portfolio = Portfolio.items[index];
    
                   return Container(
                     width: 180,
                     margin: EdgeInsets.only(right: 16),
                     child: Card(
                       color: Colors.white, // 👈 white background
                       elevation: 3,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(16),
                       ),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                         
                           ClipRRect(
                             borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                             child: Image.asset(
                               portfolio.imageUrl,
                               height: 140, // 👈 reduced image height
                               width: double.infinity,
                               fit: BoxFit.cover,
                             ),
                           ),
    
                         
                           Container(
                             width: double.infinity,
                             padding: EdgeInsets.all(12),
                             decoration: BoxDecoration(
                               color: Colors.white, // 👈 title area white
                               borderRadius: BorderRadius.vertical(
                                 bottom: Radius.circular(16),
                               ),
                             ),
                             child: Text(
                               portfolio.title,
                               style: TextStyle(
                                 color: Colors.black,
                                 fontWeight: FontWeight.w600,
                                 fontSize: 15,
                               ),
                             ),
                           ),
                         ],
                       ),
                     ),
                   );
                 },
               ),
             )
    
        ],
      ),
    );
  }
}


class Section1 extends StatelessWidget {
  const Section1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Align(
       alignment: Alignment.topLeft,
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         
         children: [
           Text('Contact', style:TextStyle(
             color: Colors.black,
             fontSize: 20,
             fontWeight: FontWeight.w500,
    
           )),
    
           SizedBox(height:10),
           ListItem(title:'Email', subtitle:'ethan.carter@email.com', icon: FaIcon(FontAwesomeIcons.envelope)),
           ListItem(title:'Phone', subtitle:'+1 234 567 8901', icon: FaIcon(FontAwesomeIcons.phone)),
          
    
    
        
        
        
         ],
        
        ),
      ),
    );
  }
}


class Section2 extends StatelessWidget {
  const Section2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
     padding: const EdgeInsets.all(18.0),
     child: Align(
      alignment: Alignment.topLeft,
       child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Text('Services', style:TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
    
          )),
    
          SizedBox(height:13),
          ListItem(title:'Electrical Wiring',  icon: FaIcon(FontAwesomeIcons.boltLightning)),
          ListItem(title:'Appliance Installation', icon: FaIcon(FontAwesomeIcons.plug)),
          ListItem(title:'Lighting Repair', icon: FaIcon(FontAwesomeIcons.lightbulb)),
    
    
       
       
       
        ],
       
       ),
     ),
           );
  }
}


class ListItem extends StatelessWidget {
  final String title;
  final String? subtitle;     // nullable
  final FaIcon icon;

  ListItem({
    super.key,
    required this.title,
    this.subtitle,            // not required
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: CustomColors.primaryColor.withAlpha(20),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: icon),
      ),
      
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),

      subtitle: subtitle != null 
        ? Text(
            subtitle!,
            style: TextStyle(
              color:CustomColors.primaryColor,
              fontWeight: FontWeight.w300,
            ),
          )
        : null,   // if no subtitle → ListTile removes this area automatically
    );
  }
}

