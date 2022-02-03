import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue,),
        
    home:Teacherlogin(),
    );
  }
}
class Teacherlogin extends StatefulWidget {
  const Teacherlogin({ Key? key }) : super(key: key);

  @override
  _TeacherloginState createState() => _TeacherloginState();
}

class _TeacherloginState extends State<Teacherlogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: PreferredSize(preferredSize: Size.fromHeight(100.0),child:AppBar(title: Text("Teacher Login"),backgroundColor: Colors.blue[900],
        elevation: 0,
        actions: [
          Icon(Icons.notification_add),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.menu_rounded),
          ),
        ],bottom: PreferredSize(preferredSize: Size.square(20), child:Padding(
          padding: const EdgeInsets.all(10),
          child: Row(children: [CircleAvatar(child: Image.asset('assets/circle_img.png'),),Padding(
            padding: const EdgeInsets.only(left: 10),
            
              child: Column(
                children: [
                  Text("Jack Dowson",style: TextStyle(fontWeight:FontWeight.bold,color: Colors.white),
                  ),Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Teacher:Physics,Math\nID:PMT65234",style: TextStyle(color: Colors.white),
                  )
                  )],
              ),
            ),
          ],),
        ) 
        )
    )),
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(child: GridView.count(crossAxisCount: 2,children: [
      
       
        Container(child:Image.asset('assets/Grid1.png')),
        Container(child:Image.asset('assets/Grid2.png')),
        Container(child:Image.asset('assets/Grid3.png')),
        Container(child:Image.asset('assets/Grid4.png')),
        Container(child:Image.asset('assets/Grid5.png')),
        Container(child:Image.asset('assets/Grid6.png')),
        Container(child:Image.asset('assets/Grid7.png')),

        ],
       
    )),),
      
    );
  }
}


