import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:etjob_clone_app/LoginPage/login_screen.dart';
import 'package:etjob_clone_app/user_state.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initiallization = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initiallization,
        builder: (context, snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('ijob clone is being initialized',
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            );
          }
          else if(snapshot.hasError)
          {
            return const MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('an error occured',
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Signatra'
                    ),
                  ),
                ),
              ),
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ijob clone app',
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.black,
              primarySwatch: Colors.blue,
            ),
            home: UserState(),
          );
        }
    );
  }
}
