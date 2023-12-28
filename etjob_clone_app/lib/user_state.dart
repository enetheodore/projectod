import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:etjob_clone_app/Jobs/job_screen.dart';
import 'package:etjob_clone_app/LoginPage/login_screen.dart';

class UserState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx,userSnapShot){
        if(userSnapShot.data==null){
          print('User is not logged in yet');
          return Login();
        }else if(userSnapShot.hasData){
          print('User is already logged in');
          return JobScreen();
        }else if(userSnapShot.hasError){
          return const Scaffold(
            body: Center(
              child: Text('An Error Has Been Occurred. Try Again Letter'),
            ),
          );
        }else if(userSnapShot.connectionState==ConnectionState.waiting){
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: Text('Something went wrong'),
          ),
        );
      },
    );
  }
}
