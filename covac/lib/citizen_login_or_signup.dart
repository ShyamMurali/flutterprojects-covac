import 'package:covac/citizen_registeration.dart';
import 'package:covac/login_citizen.dart';
import 'package:flutter/material.dart';
class Citizen_login_or_signup extends StatelessWidget {
  static const routename ='/citizenloginorsignup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor:Colors.white, 
     body:Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
           Column(children: <Widget>[
             Container(
               width:150,height: 150,
               child: ClipOval(
                 child: Image.asset('assets/images/vaccine.jpg'))),
           Text("CovaC",style: TextStyle(fontSize: 45,),),
           Text("'A little Pain for a lot of Gain'",style: TextStyle(fontSize: 19,),),
           SizedBox(height: 10,),
           Text("Citizen",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 15),),
            SizedBox(height:10)],),
          Row(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
          RaisedButton(onPressed: ()=>{
        Navigator.pushReplacementNamed(context,CitizenLogin.routename )},
          child: Text("Log In!"),
          textColor: Colors.white,
          color: Colors.black,
           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),                  ),
          SizedBox(width:20),
          RaisedButton(onPressed: ()=>{Navigator.pushReplacementNamed(context,CitizenRegisteration.routeName )},
          child: Text("Sign Up!",)
          ,textColor: Colors.white,
          color: Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),],)
    ],),
      
    );
  }
}