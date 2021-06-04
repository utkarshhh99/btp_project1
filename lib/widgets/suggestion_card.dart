import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class SuggestionCard extends StatelessWidget {
  List<Icon> icons = [Icon(Icons.check_circle,color: Colors.green,) , Icon(Icons.remove_circle,color: Colors.red,)];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.02),
        //height: height*0.35,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "TASK SUMMARY",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx,i){
              return Container(
                height: height*0.04,
                child: ListTile(
                title: Text("I did meditation for 2 min"),
                leading: i<3 ? icons[0] : icons[1],
              ),);
            },itemCount: 7,)
          ],
        ),
      ),
    );
  }
}
