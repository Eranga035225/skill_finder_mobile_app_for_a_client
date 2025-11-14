import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Color buttonColor;
  String text;

   CustomButton({
    super.key,
    required this.buttonColor,
    required this.text,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
          width:  MediaQuery.of(context).size.width , 
          height: 50,
          decoration: BoxDecoration(
            color:buttonColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child:Center(child: Text(text, style:TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.w500))));
  }
}