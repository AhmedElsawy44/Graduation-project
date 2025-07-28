import 'package:flutter/material.dart';
import 'package:graduation_project/layers/chat_screen.dart';
import 'package:graduation_project/layers/login.dart';
import 'package:graduation_project/layers/register.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp(
 options: DefaultFirebaseOptions.currentPlatform
 
  
  );
  runApp(const Chatapp());
}

class Chatapp extends StatelessWidget {
  const Chatapp({super.key});
@override
  Widget build(BuildContext context) {
  return MaterialApp(
    routes: {
      Login.id: (context) =>  const Login(),
      RegiterPage.id: (context) =>  const RegiterPage(),
      ChatScreen.id: (context) =>  ChatScreen(),
    },
    home: const Login(),
    debugShowCheckedModeBanner: false,
  );
}
}
      