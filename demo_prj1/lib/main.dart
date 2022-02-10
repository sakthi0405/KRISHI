import 'package:flutter/material.dart';
import 'dart:async';

void main() { runApp(new MaterialApp( home: new MyApp(), )); }

   class MyApp extends StatefulWidget { 

   @override _MyAppState createState() => new _MyAppState(); 
   }

   class _MyAppState extends State { 
    @override void initState() { 
    super.initState(); 
    new Future.delayed( const Duration(seconds: 4), () =>
    Navigator.pushReplacement( context, 
    MaterialPageRoute(builder: (context) => LoginScreen()),
       ));
     }

    @override 
     Widget build(BuildContext context) {
     return new Scaffold( 
      backgroundColor: Colors.white, 
       body: Column(
         children: [
           Container( 
           height: double.infinity, 
           width: double.infinity, 
      child: Padding(
            padding: const EdgeInsets.all(30),
            child: Image.asset("assets/images/welcome_gif1.gif",  
            width: 30,height: 30,
            ),
      ),
      
      ),
      
         ],
         
       ));
      } 
      }
      class LoginScreen extends StatefulWidget {
        const LoginScreen({ Key? key }) : super(key: key);
      
        @override
        _LoginScreenState createState() => _LoginScreenState();
      }
      
      class _LoginScreenState extends State<LoginScreen> {
        @override
        Widget build(BuildContext context) {
          return Container(
            
          );
        }
      }