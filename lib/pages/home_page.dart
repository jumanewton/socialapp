
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logOut() {
    // log out the user
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.deepPurpleAccent,
        centerTitle: true,
        actions: [
          // log out button
          IconButton(
            onPressed: logOut,
            icon: const Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}
