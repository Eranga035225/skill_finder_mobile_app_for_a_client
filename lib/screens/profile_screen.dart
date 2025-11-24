import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                     fontSize: 25,
                     fontWeight: FontWeight.w500,
                   ),
                 ),
                 Text('Electrician', style: TextStyle(
                  color: Color(int.parse('0xFF618A8A')),
                  fontSize: 18,
                  // fontWeight: FontWeight.w600,
                 ),),
                 Text('5 years of experience', style: TextStyle(
                  color: Color(int.parse('0xFF618A8A')),
                  fontSize: 18,
                  // fontWeight: FontWeight.w500,
                 ),),
               ],
             ),
           ),
           SizedBox(height:20),
           Section1(), //contact section
           Section2(), // services section
           
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Column(
               children: [
                 Text('Portfolio', style:TextStyle(
                  color: Colors.black,
                   fontSize: 20,
                   fontWeight: FontWeight.w500,
                 
                 )),
                SizedBox(height:13),
                ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return Container(
                      

                    );
                  }
                ),



               ],
             ),
           ),






          
           
        
       
          
       
       
       
       
       
         ],
       ),
     ),
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
          color: Color(0xFF618A8A).withAlpha(30),
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
              color: Color(0xFF618A8A),
            ),
          )
        : null,   // if no subtitle → ListTile removes this area automatically
    );
  }
}

