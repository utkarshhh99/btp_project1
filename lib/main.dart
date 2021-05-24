import './models/tile_list.dart';
import 'package:flutter/material.dart';
import './screens/tabScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (BuildContext context) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<ActivityProvider>(create: (_) => ActivityProvider())
            ],
            child: TabScreen(),
          );
        },
      ),
    );
  }
}
