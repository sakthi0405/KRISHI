import 'package:flutter/material.dart';

class TeacherLogin extends StatelessWidget {
  List<String> images = ["asset/image/Group_667.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher login'),
        backgroundColor: Colors.blue[900],
        elevation: 0,
        actions: [
          Icon(Icons.notification_add),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: Colors.blue[900],
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Image.asset("asset/image/Ellipse_3.png"),
                Column(
                  children: <Widget>[
                    Text("Jack Dowson"),
                    Text("Teacher:Physics,Math"),
                    Text("ID:PMT65234"),
                  ],
                ),
              ],
            ),
          ),
          GridView.builder(
            itemCount: images.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(images[index]);
            },
          )
        ],
      ),
    );
  }
}
