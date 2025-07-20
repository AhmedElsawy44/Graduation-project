import 'package:flutter/material.dart';
import 'package:graduation_project/layers/login.dart';
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
    
    home: Login(),
    
    
  );
}
}
      