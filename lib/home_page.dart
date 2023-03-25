import 'package:bai_tap/logged_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'features/auth/screens/log_in_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if(snapshot.hasData){
              return const Center(
                child: LoggedInWidget(),
              );
            }else if(snapshot.hasError){
              return const Center(
                child: Text('Error'),
              );
            } else {
              return const Center(
                child: LoginScreen(),
              );
            }
          },
        )
      );
}