import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tasktodo/Views/edit_task.dart';
import 'package:tasktodo/Views/login.dart';

class CheckAuth extends StatelessWidget {
  const CheckAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return EditTask();
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Login();
          } else {
            print(snapshot.error);
            return Login();
          }
        },
      ),
    );
  }
}
