import 'package:flutter/material.dart';

class Viewcertificate extends StatelessWidget {
  static const routename = '/viewcert';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('View your Certificate'),
          backgroundColor: Colors.blueGrey[900],
        ),
        backgroundColor: Colors.blueGrey[900],
        body: Center(
          child: Image.asset('assets/images/certificate.jpg'),
        ));
  }
}
