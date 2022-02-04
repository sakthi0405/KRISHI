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
    return Scaffold(
      appBar: CalendarAppBar(
        onDateChanged: (value) => setState(() => selectedDate = value),
        lastDate: DateTime.now(),
        events: List.generate(
            100,
            (index) => DateTime.now()
                .subtract(Duration(days: index * random.nextInt(5)))),
      ),
      body:BodyLayout(),
    );
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