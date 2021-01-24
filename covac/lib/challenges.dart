import 'package:covac/citizen_registeration.dart';
import 'package:covac/covid_safety.dart';
import 'package:covac/image.dart';
import 'package:flutter/material.dart';
import 'package:covac/citizen.dart';
import 'package:firebase_database/firebase_database.dart';

class Challenges extends StatefulWidget {
  static const routename = '/challenges';
  Citizen _citizen;
  Challenges(this._citizen){
    print('constructor mob: '+_citizen.mobileno.toString());
  }
  
  @override
  _ChallengesState createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Challenges'),
          backgroundColor: Colors.black,
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Challenge 1-Login'),
              subtitle: Text('Collect Your badge on your first login'),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: () => _badgeearned(context),
            ),
            ListTile(
              title: Text('Challenge 2-Slot booking'),
              subtitle: Text(
                  'Collect your badge on your first slot booking for vaccination'),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: () {
                if (widget._citizen.isbadge2 == false)
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text(
                            "Complete the challenge by booking a slot. Booking can be done in the side drawer"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text(
                              "Ok",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                if (widget._citizen.isbadge2 == true) _badgeearned(context);
              },
            ),
            ListTile(
              title: Text('Challenge 3-Covid Quiz'),
              subtitle: Text(
                  'Read the given covid info and take the quiz to colllect the badge'),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: () {
                if (widget._citizen.isbadge3 == false){
                  // widget._userref.child('citizen/${widget._citizen.mobileno}').update({
                  //   'isbadge3':true,
                  //   'badgeno':widget._citizen.badgeno+1,
                  // }).then((value) {
                  //    Navigator.pushNamed(context, Covid_Safety.routename,
                  //     arguments: widget._citizen);
                  // });
                  Navigator.pushNamed(context, Covid_Safety.routename,arguments: widget._citizen);
                }
                 
                if (widget._citizen.isbadge3 == true) _badgeearned(context);
              },
            ),
            ListTile(
              title: Text('Challenge 4-Take a vaccine and be a hero'),
              subtitle: Text('Collect your badge by taking your first vaccine'),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: () {
                if (widget._citizen.isbadge4 == false)
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: Text(
                            "Complete the challenge by getting vaccinated"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text(
                              "Ok",
                              style: TextStyle(color: Colors.black),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                if (widget._citizen.isbadge4 == true) _badgeearned(context);
              },
            ),
            ListTile(
              title: Text('Challenge 5-Selfie time'),
              subtitle: Text(
                  'Collect your badge by uploading a selfie in mask from the gallery'),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: () {
                if (widget._citizen.isbadge5 == false)
                  Navigator.pushNamed(context, UploadImage.routename,
                      arguments: citizen);
                if (widget._citizen.isbadge5 == true) _badgeearned(context);
              },
            ),
          ],
        ));
  }
}

_badgeearned(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Text("Challenge Completed & Badge Received"),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Ok",
              style: TextStyle(color: Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}