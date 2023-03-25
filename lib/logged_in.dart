import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/auth/auth_controller.dart';


class LoggedInWidget extends StatelessWidget {
  const LoggedInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logged In'),
        actions: [
          TextButton(
            onPressed: () {
              final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: const Text(
              'Logout',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child:  Center(
          child: Column(
            children: [
              Text('Profile'),
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(user.photoURL!),
              ),
              SizedBox(
                height: 20,
              ),
              Text(user.displayName!),
              SizedBox(
                height: 20,
              ),
              Text(user.email!),
            ],
          ),
        ),
      ),
    );
  }
}