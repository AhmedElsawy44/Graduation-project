import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/bloc/register/register_bloc.dart';
import 'package:graduation_project/bloc/register/register_event.dart';
import 'package:graduation_project/bloc/register/register_state.dart';
import 'package:graduation_project/layers/chat_screen.dart';
import 'package:graduation_project/widgets/CustomButon.dart';
import 'package:graduation_project/widgets/custom_password_field.dart';
import 'package:graduation_project/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:fluttertoast/fluttertoast.dart';


class RegiterPage extends StatelessWidget {
  const RegiterPage({super.key});
  static const String id = 'Register';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterBloc(),
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            Fluttertoast.showToast(
              msg: state.errorMessage!,
             toastLength: Toast.LENGTH_LONG,
             gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red,
             textColor: Colors.white,
             fontSize: 16.0,
  );
          } else if (state.isSuccess) {
             Fluttertoast.showToast(
              msg: "Register Successfully",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.green,
             textColor: Colors.white,
             fontSize: 16.0,
            );
            Navigator.pushNamed(context, ChatScreen.id);
          }
        },
        builder: (context, state) {
          final bloc = BlocProvider.of<RegisterBloc>(context);
          return ModalProgressHUD(
            inAsyncCall: state.isLoading,
            progressIndicator: const CircularProgressIndicator(),
            child: Scaffold(
              backgroundColor: const Color(0xFF565F76),
              body: Column(
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
                  const SizedBox(height: 20),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Form(
                        child: ListView(
                          children: [
                            CustomTextField(
                              onchanged: (val) => bloc.add(EmailChanged(val)),
                              hintText: 'Email',
                            ),
                            const SizedBox(height: 10),
                            CustomTextField(
                              onchanged: (val) => bloc.add(FirstNameChanged(val)),
                              hintText: 'first name'),
                            const SizedBox(height: 10),
                            CustomTextField(
                              onchanged: (val) => bloc.add(LastNameChanged(val)),
                              hintText: 'last name'),
                            const SizedBox(height: 10),
                            CustomTextField(
                              onchanged: (val) => bloc.add(PhoneChanged(val)),
                              hintText: 'phone'),
                            const SizedBox(height: 10),
                            CustompasswordField(
                              onchanged: (val) => bloc.add(PasswordChanged(val)),
                              hintText: 'Password',
                              obscureText: true,
                            ),
                            const SizedBox(height: 10),
                            CustompasswordField(
                              onchanged: (val) => bloc.add(ConfirmPasswordChanged(val)),
                              hintText: 'Confirm Password',
                              obscureText: true,
                            ),
                            const SizedBox(height: 20),                                              
                          ],
                        ),
                      ),
                    ),
                  ),
                  Custombuton(
                     onTap: () => bloc.add(RegisterSubmitted()) ,
                    text: 'Register',
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
