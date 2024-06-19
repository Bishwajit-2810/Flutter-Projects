import 'package:authentication/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/my_text_field.dart';
import '../components/my_button.dart';
import '../components/square_tile.dart';

class SignUpPage extends StatelessWidget {
  final void Function()? onTap;
  SignUpPage({super.key, required this.onTap});
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                  const Text("Let's create an account for you!"),
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
                    height: 10,
                  ),
                  //user  password
                  MyTextField(
                    controller: confirmPasswordController,
                    hintText: "Confirm password",
                    obscureText: true,
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  // login button
                  MyButton(
                    onTap: () => signUpUser(context),
                    text: "Sign Up",
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
                      const Text("Already a member?"),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: onTap,
                        child: const Text(
                          "Login Now",
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

  void signUpUser(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: userNameController.text,
          password: passwordController.text,
        );
        Navigator.pop(context);
        successSnackbar(
          context,
        );
      } else {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password don't match!"),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      errorSnackbar(context, e.code);
    }
  }

  void successSnackbar(BuildContext context) {
    const snackBar = SnackBar(content: Text("SignUp successful"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void errorSnackbar(BuildContext context, String e) {
    final snackBar = SnackBar(content: Text(e));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
