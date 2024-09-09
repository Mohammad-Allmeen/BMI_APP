
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'main.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget
{
  @override
  State<SplashScreen> createState()=> _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState()
  {
    super.initState();
    Timer(Duration(seconds: 3),()
    {
      Navigator.pushReplacement(context,
      MaterialPageRoute(
          builder: (context) => const MyHomePage(title: "HOME PAGE")
      ),
      );
    });
  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage("https://play-lh.googleusercontent.com/wiLKNn9tyY-SiNWg_Pib1stLmZU9lYuadq-Y4ASfi7OtJzLDmDknUFcqejQjw4Sqjg"),
              backgroundColor: Colors.white,
              radius: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text("BMI APP", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 50),)
          ],
        ),
        
      ),
    );
  }
}