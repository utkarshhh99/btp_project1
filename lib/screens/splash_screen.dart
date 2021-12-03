import 'package:btp_project1/screens/tabScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

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
    var now = DateTime.now();
    int date = now.day;
    var monthStr= DateFormat.MMMM().format(now);

    final filterString ='orderBy="id"&equalTo="$user"';
    var url = Uri.parse("https://tracker-deck-default-rtdb.firebaseio.com/users.json?$filterString");
    var url1 = Uri.parse("https://tracker-deck-default-rtdb.firebaseio.com/sleep/$user/$monthStr.json");
    var url2 = Uri.parse("https://tracker-deck-default-rtdb.firebaseio.com/workout/$user/$monthStr.json");
    var url3 = Uri.parse("https://tracker-deck-default-rtdb.firebaseio.com/water/$user/$monthStr.json");

    final response = await http.get(url);
    final response1 = await http.get(url1);
    final response2 = await http.get(url2);
    final response3 = await http.get(url3);

    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    final extractedData1 = json.decode(response1.body) as Map<String, dynamic>;
    final extractedData2 = json.decode(response2.body) as Map<String, dynamic>;
    final extractedData3 = json.decode(response3.body) as Map<String, dynamic>;

    int sleep = 0;
    int workout = 0;
    int water = 0;

    if(extractedData == null){
      print("NO data found for user");
    }
    if(extractedData1 == null){
      print("NO data found for sleep");
    }
    else{

      extractedData1.forEach((key, value) {
        if(value.length>= date+1)
        sleep = value[date];
       });
    }
    if(extractedData2 == null){
      print("NO data found for workout");
    }
    else{

      extractedData2.forEach((key, value) {
        if(value.length>= date+1)
        workout = value[date];
      });
    }
    if(extractedData3 == null){
      print("NO data found for water");
    }
    else{
      extractedData3.forEach((key, value) {
        if(value.length>= date+1)
        water = value[date];
      });
    }

    List<String> userData = [" "," "," "];
    extractedData.forEach((key, value) {
      userData[0] = value['userName'];
      userData[1] = value['email'];
      userData[2] = value['phone'];
    });
    print(water);print(sleep);print(workout);
    
    Navigator.push(context, MaterialPageRoute(builder: (ctx)=> TabScreen(userData,sleep,workout,water)));
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
