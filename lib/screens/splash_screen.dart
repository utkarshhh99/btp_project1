import 'package:btp_project1/screens/tabScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData()async{

    var user = FirebaseAuth.instance.currentUser.uid;
    final filterString ='orderBy="id"&equalTo="$user"';
    var url = Uri.parse("https://tracker-deck-default-rtdb.firebaseio.com/users.json?$filterString");
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if(extractedData == null){
      print("NO data found");
    }
    print(extractedData);
    List<String> userData = [" "," "," "];
    extractedData.forEach((key, value) {
      userData[0] = value['userName'];
      userData[1] = value['email'];
      userData[2] = value['phone'];
    });
    Navigator.push(context, MaterialPageRoute(builder: (ctx)=> TabScreen(userData)));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "TrackerDeck",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: Color.fromRGBO(237, 73, 103, 1),
              ),
            ),
            CircularProgressIndicator(valueColor:
            new AlwaysStoppedAnimation<Color>(Color.fromRGBO(237, 73, 103, 1))),
            SizedBox(height: 40,),
            Text("LOADING...PLEASE WAIT!",style: TextStyle(color: Color.fromRGBO(237, 73, 103, 1),fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
