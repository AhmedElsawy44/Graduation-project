
import 'package:flutter/material.dart';

class Custombuton extends StatelessWidget {
  Custombuton({this.onTap,required this.text }) ;
  VoidCallback?onTap;

  String text ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:Container(
      height: 40,
      width: 90,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 82, 90, 111),
        borderRadius: BorderRadius.circular(20),
      ),
      child:  Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    ),

    

    );
  }
  
}