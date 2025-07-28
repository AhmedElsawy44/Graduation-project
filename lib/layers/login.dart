import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/bloc/login/login_bloc.dart';
import 'package:graduation_project/bloc/login/login_event.dart';
import 'package:graduation_project/bloc/login/login_state.dart';
import 'package:graduation_project/layers/chat_screen.dart';
import 'package:graduation_project/layers/register.dart';
import 'package:graduation_project/widgets/CustomButon.dart';
import 'package:graduation_project/widgets/modal_progress_hud_nsn.dart';
import 'package:graduation_project/widgets/show_snack_bar.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  static const String id = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.errorMessage != null) {
            showSnackBar(context, state.errorMessage!);
          } else if (state.isSuccess) {
            showSnackBar(context, "Login successful");
            Navigator.pushNamed(context, ChatScreen.id);
          }
        },
        builder: (context, state) {
          final bloc = BlocProvider.of<LoginBloc>(context);

          return ModalProgressHUD(
            inAsyncCall: state.isLoading,
            progressIndicator: const CircularProgressIndicator(),
            child: Scaffold(
              backgroundColor: const Color(0xFF565F76),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 300,
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
                                color: Colors.white,
                                fontFamily: 'pacifico',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Form(
                        child: Column(
                          children: [
                            TextFormField(
                              onChanged: (val) => bloc.add(EmailChanged(val)),
                              decoration: InputDecoration(
                                hintText: 'Email',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              obscureText: true,
                              onChanged: (val) => bloc.add(PasswordChanged(val)),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            const SizedBox(height: 20),
                            if (state.isSubmitted && !state.isValid)
                              const Text(
                                'Please fill in all fields correctly.',
                                style: TextStyle(color: Colors.red),
                              ),
                            const SizedBox(height: 20),
                            Custombuton(
                              text: 'Login',
                              onTap: () => bloc.add(LoginSubmitted()),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("Don't have an account?"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (_) => const RegiterPage()),
                                    );
                                  },
                                  child: const Text(
                                    "Register",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
