import 'package:first_apiapp/wallpaper.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light),
      home: HeaderBar(),
    );
  }
}
class HeaderBar extends StatefulWidget {
  const HeaderBar({ Key? key }) : super(key: key);

  @override
  _HeaderBarState createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
        title: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              
               
            ),
            child: const Text('Wallpaper API',
            style: TextStyle(color: Colors.purple),)),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.search,color: Colors.purple,),
          ),
        ],
      ),
      body: Wallpaper(),
      
    );
  }
}