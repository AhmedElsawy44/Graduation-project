import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/widgets/CustomButon.dart';
import 'package:graduation_project/widgets/custom_text_field.dart';
class RegiterPage extends StatelessWidget {
   RegiterPage ({super.key,});
  String? email;
   String? password;
   String? confirmPassword;
   GlobalKey<FormState> formkey = GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: const Color(0xFF565F76),
      body: 

      Column(
          children: [
            Container(
              height: 250,
              decoration: const BoxDecoration(
                color: Color(0xFF051130),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.asset(
                        'assets/images/image.jpg',
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "chatapp",
                      style: TextStyle(
                        fontSize: 40,
                        color: Color.fromARGB(102, 77, 68, 104),
                        fontFamily: 'pacifico',
                      ),
                    ),
                  ],
                ),
              ),
            ),
        const SizedBox(
          height: 20,),
     Expanded(
  child: Padding(
    padding: const EdgeInsets.all(18.0),
    child: Form(
      key: formkey,
      child: ListView(
        children: [
                    CustomTextField(
            onchanged: (p0) => email = p0,
            hintText: 'Email',
          ),
          CustomTextField(hintText: 'first name'),
          CustomTextField(hintText: 'last name'),
          CustomTextField(hintText: 'phone'),
          CustomTextField(
            onchanged: (p0) => password = p0,
            hintText: 'Password',
            obscureText: true,
          ),
          CustomTextField(
            onchanged: (p0) => confirmPassword = p0,
            hintText: 'Confirm Password',
            obscureText: true,
          ),
        ],
      ),
    ),
  ),
),
         
          
          Custombuton( 
            onTap: ()async {
               if (formkey.currentState!.validate()) {
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Passwords do not match")),
        );
        return;
      }
      try {
        var auth = FirebaseAuth.instance;
        await auth.createUserWithEmailAndPassword(
          email: email!,
          password: password!,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Register Successfully")),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: $e")),
        );
      }
    }
  },
  text: 'Register',
),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text("Login",style: TextStyle(color: Colors.white),))
            ]),
              const SizedBox(
          height: 20,),
          
        ],
          ),
         
     
      


      
      
    );
  }

}