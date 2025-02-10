import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialapp/components/my_button.dart';
import 'package:socialapp/components/my_textfield.dart';
import 'package:socialapp/helper/helper_functions.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controllers
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPwController = TextEditingController();

  Future<void> register() async {
    // show a loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    // check if the passwords match
    if (passwordController.text != confirmPwController.text) {
      // pop the loading circle
      Navigator.pop(context);
      // show the error message
      displayError(context, "Passwords do not match");
    }
    else{

      // try creating the user
      try {
        // create the user
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text);
        // pop the loading circle
        Navigator.pop(context);
      } on FirebaseAuthException catch (e) {
        // pop the loading circle
        Navigator.pop(context);
        // show the error message
        displayError(context, e.message!);
        }
  }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.person,
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(height: 25),
              // app name
              Text(
                'M I N I M A L',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 50),
              // Username input
              MyTextField(
                  hintText: "Usename",
                  obscureText: false,
                  controller: usernameController),

              // email input
              const SizedBox(height: 10),
              MyTextField(
                  hintText: "Email",
                  obscureText: false,
                  controller: emailController),

              // password input
              const SizedBox(height: 10),
              MyTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordController),

              // confirm password input
              const SizedBox(height: 10),
              MyTextField(
                  hintText: "Confirm Password",
                  obscureText: true,
                  controller: confirmPwController),

              // forgot password button
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
              // Register button
              const SizedBox(height: 25),
              MyButton(text: 'Register', onTap: register),
              // forgot password button
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login Here",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
