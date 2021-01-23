import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'citizen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Citizen_Report extends StatelessWidget {
  Citizen citizen;
  static const routename='/report';
  Citizen_Report(this.citizen);
  final reportcontroller = TextEditingController();
  final dbreport =FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Report your illness"),
      backgroundColor: Colors.black,),
      body: SingleChildScrollView(
              child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
             SizedBox(height: 10,),
                                Container(
                                  height:100,
                                  margin: EdgeInsets.all(10),
                                  child: TextField(
                                    minLines: 1,
                                    maxLines: 50,
                                    cursorColor: Colors.black,
                                    controller: reportcontroller,
                                    decoration: InputDecoration(
                                      labelText: 'Please Specify your illness',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                RaisedButton(onPressed: (){
                                  String data = reportcontroller.text.trim();
                                  if(data !=null || data!= ""){
                                    dbreport.child('reports/${citizen.name}').set({
                                     'report':data,
                                     'date':DateTime.now().toString(),
                                     'name':citizen.name,
                                    }).then((value){
                                    Fluttertoast.showToast(
                                      msg: 'Your illness was reported!',
                                      backgroundColor: Colors.black,
                                      textColor: Colors.white);

                                    });
                                    Navigator.pop(context);

                                  }
                                },
                                color: Colors.black,
                                child: Text('Report illness',),
                                 textColor: Colors.white,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10)),)
          ],
        ),
      ),
      
    );
  }
}