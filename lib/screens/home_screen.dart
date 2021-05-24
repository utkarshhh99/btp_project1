import '../widgets/home_tile.dart';

import '../widgets/home_mood_picker.dart';
import 'package:flutter/material.dart';
import '../widgets/home_hello_block.dart';
import '../models/tile_list.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    //final activity = Provider.of<Activity>(context);
    final activities =Provider.of<ActivityProvider>(context).activities;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: deviceWidth * 0.08,
          top: deviceHeight * 0.06,
          right: deviceWidth * 0.08,
        ),
        child: SingleChildScrollView(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HelloBlock(),
              SizedBox(
                height: deviceHeight * 0.04,
              ),
              MoodPicker(),
              SizedBox(
                height: deviceHeight * 0.01,
              ),
              //HomeTile(activity: activities[1],),
             GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.0,
                  mainAxisExtent:  deviceHeight*0.2,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: activities.length,
                  
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context,int index) {
                    return HomeTile(index:index);
                    
                  }),
                
              
            ],
          ),
        ),
      ),
      //floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: (){},),
    );
  }
}
