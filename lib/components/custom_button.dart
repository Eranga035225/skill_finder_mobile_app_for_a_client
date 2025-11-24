import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Color buttonColor;
  String text;
 double height;
  double width;

   CustomButton({
    super.key,
    required this.buttonColor,
    required this.text,
    required this.height,
    required this.width,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
          width: width, 
          height: height,
          decoration: BoxDecoration(
            color:buttonColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child:Center(child: Text(text, style:TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.w500))));
  }
}