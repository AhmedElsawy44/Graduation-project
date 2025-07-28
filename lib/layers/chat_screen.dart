import 'package:flutter/material.dart';
import 'package:graduation_project/res/app_colors.dart';
import 'package:graduation_project/res/constants.dart';
class ChatScreen extends StatelessWidget {
static const String id = 'chat_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        automaticallyImplyLeading: false,
        title:
       
        Row(
          
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [            
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),),
              child: 
               Image.asset(klogo,height: 45,width: 45,
              
              ),
        ),
          
            
            const SizedBox(width: 20),
        const Text('Chat Screen',
          style: TextStyle(fontSize: 24, color:AppColors.textLight),
        
        ),
  ]

        
       
      ),

      ),
  
      body: Center(
        child: Text('This is the chat screen.'),
      ),
    );
  }
}