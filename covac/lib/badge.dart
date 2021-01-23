import 'package:flutter/material.dart';
import 'package:covac/citizen.dart';

class Badges extends StatefulWidget {
  static const routename = '/badges';
  Citizen citizen;
  Badges(this.citizen);

  @override
  _BadgesState createState() => _BadgesState();
}

class _BadgesState extends State<Badges> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Badges Earned"),
          backgroundColor: Colors.black,
        ),
        body: Column(children: <Widget>[
          // Card(
          //   margin: EdgeInsets.all(10),
          //   elevation: 5,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: <Widget>[
          //         Text(
          //           "Total no of badges earned: " +
          //               widget.citizen.badgeno.toString(),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          if (widget.citizen.isbadge1 == true)
            Card(
              margin: EdgeInsets.all(10),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Badge Recieved for Login'),
                    Image.asset('assets/images/login.jpg',
                        height: 110, width: 110),
                  ],
                ),
              ),
            ),
          if (widget.citizen.isbadge2 == true)
            Card(
              margin: EdgeInsets.all(10),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Badge Recieved for Slot Booking'),
                    Image.asset('assets/images/booking.jpg',
                        height: 110, width: 110),
                  ],
                ),
              ),
            ),
          if (widget.citizen.isbadge3 == true)
            Card(
              margin: EdgeInsets.all(10),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Badge Recieved for Covid Quiz'),
                    Image.asset('assets/images/quiz.jpg',
                        height: 110, width: 110),
                  ],
                ),
              ),
            ),
          if (widget.citizen.isbadge4 == true)
            Card(
              margin: EdgeInsets.all(10),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Badge Recieved for taking vaccine'),
                    Image.asset('assets/images/vaccinehero.jpg',
                        height: 110, width: 110),
                  ],
                ),
              ),
            ),
          if (widget.citizen.isbadge5 == true)
            Card(
              margin: EdgeInsets.all(10),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text('Badge Recieved for Uploading Selfie'),
                    Image.asset('assets/images/selfie.jpg',
                        height: 110, width: 110),
                  ],
                ),
              ),
            ),
        ]));
  }
}
