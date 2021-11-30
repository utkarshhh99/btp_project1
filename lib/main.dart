import 'package:btp_project1/screens/logIn_screen.dart';
import 'package:btp_project1/screens/splash_screen.dart';
import 'package:btp_project1/screens/tabScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './models/tile_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    return Builder(
      builder: (BuildContext context) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<ActivityProvider>(
                create: (_) => ActivityProvider())
          ],
          child: MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: StreamBuilder(
                stream: _auth.authStateChanges(),
                builder: (BuildContext ctx, snapshot) {
                  if (snapshot.hasData) {
                    return SplashScreen();
                  }
                  return LoginScreen();
                }),
          ),
        );
      }
    );
  }
}
