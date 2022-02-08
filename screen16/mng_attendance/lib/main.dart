import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'dart:math';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manage Attendance',debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? selectedDate;
  Random random = new Random();

  @override
  void initState() {
    setState(() {
      selectedDate = DateTime.now();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CalendarAppBar(
        onDateChanged: (value) => setState(() => selectedDate = value),
        lastDate: DateTime.now(),
        events: List.generate(
            100,
            (index) => DateTime.now()
                .subtract(Duration(days: index * random.nextInt(5)))),
      ),
      
      //key: BodyLayout,
          body: Container(
            height: 160.0,
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.red,
                  width: MediaQuery.of(context).size.width,
                  height: 100.0,
                  child: Center(
                    child: Text(
                      "Home",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
                Positioned(
                  top: 80.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1.0),
                          border: Border.all(
                              color: Colors.grey.withOpacity(0.5), width: 1.0),
                          color: Colors.white),
                      /*child: Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.menu,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              print("your menu action here");
                              BodyLayout.currentState.openDrawer();
                            },
                          ),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Search",
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              print("your menu action here");
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.notifications,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              print("your menu action here");
                            },
                          ),
                        ],
                      ),*/
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      /*appBar: CalendarAppBar(
        onDateChanged: (value) => setState(() => selectedDate = value),
        lastDate: DateTime.now(),
        events: List.generate(
            100,
            (index) => DateTime.now()
                .subtract(Duration(days: index * random.nextInt(5)))),
      ),
      body:BodyLayout(),*/
    
  }
}

class BodyLayout extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return _myListView(context);
      }
    }


 Widget _myListView(BuildContext context) {
    
      final titles = ['Physics Class', 'Batch 5A',];
      
      return Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
        child: ListView.builder(
          itemCount: titles.length,
          itemBuilder: (context, index) {
            return Card( //                           <-- Card widget
              child: ListTile(

                title: Text(titles[index]),
                trailing: Icon(Icons.arrow_drop_down),
                
              ),
            );
          },
        ),
      ));
    }