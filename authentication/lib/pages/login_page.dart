import 'package:authentication/components/my_button.dart';
import 'package:authentication/components/my_text_field.dart';
import 'package:authentication/components/square_tile.dart';
import 'package:authentication/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  //logo
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text("Welcome back you've been missed"),
                  const SizedBox(
                    height: 20,
                  ),
                  //user name
                  MyTextField(
                    hintText: "Email",
                    obscureText: false,
                    controller: userNameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //user  password
                  MyTextField(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  // forgot button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 25,
                  ),
                  // login button
                  MyButton(
                    text: "Sign In",
                    onTap: () => signInUser(context),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //other options
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text("Or continue with"),
                      ),
                      Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(
                        onTap: () {
                          AuthService2().signInWithGoogle();
                        },
                        imagePath: "lib/images/icons8-google-500.png",
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      SquareTile(
                        onTap: () {},
                        imagePath: "lib/images/icons8-apple-500.png",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Not a member?"),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: const Text(
                          "Register Now",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signInUser(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: userNameController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
      successSnackbar(
        context,
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      errorSnackbar(context, e.code);
    }
  }

  void successSnackbar(BuildContext context) {
    const snackBar = SnackBar(content: Text("Login successful"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void errorSnackbar(BuildContext context, String e) {
    final snackBar = SnackBar(content: Text(e));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
