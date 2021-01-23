import 'package:covac/quiz.dart';
import 'citizen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
class Covid_Safety extends StatelessWidget {
  static const routename ='/covidsafety';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Covid Saftey Information'),
      backgroundColor: Colors.black,),
        body: BodyWidget(),
      
    );
  }
}
class BodyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Image(image: AssetImage('assets/images/3.png')),
      Image(image: AssetImage('assets/images/2.png')),
      Image(image: AssetImage('assets/images/4.png')),
      Image(image: AssetImage('assets/images/5.png')),
      SizedBox(
        height: 20.0,
      ),
      RaisedButton(
        onPressed: () {
          Navigator.pushNamed(context, CovidQuiz.routename);
        },
         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          'Ready to take the quiz',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        color: Colors.black,
      ),
    ]);
  }
}