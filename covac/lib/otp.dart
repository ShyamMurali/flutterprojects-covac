import 'package:covac/citizen.dart';
import 'package:covac/citizen_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_database/firebase_database.dart';

class OTPScreen extends StatefulWidget {
  static const routename = '/otp';
  final Citizen _citizen;
  OTPScreen(this._citizen);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    color: const Color.fromRGBO(43, 46, 66, 1),
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color: const Color.fromRGBO(126, 203, 224, 1),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('OTP Verification -Citizen'),
         backgroundColor: Colors.blueGrey[900],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                'Verify +91-${widget._citizen.mobileno}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: PinPut(
              fieldsCount: 6,
              textStyle: const TextStyle(fontSize: 25.0, color: Colors.white),
              eachFieldWidth: 40.0,
              eachFieldHeight: 55.0,
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: pinPutDecoration,
              selectedFieldDecoration: pinPutDecoration,
              followingFieldDecoration: pinPutDecoration,
              pinAnimationType: PinAnimationType.fade,
              onSubmit: (pin) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode, smsCode: pin))
                      .then((value) async {
                    if (value.user != null) {
                      Fluttertoast.showToast(
                        msg: "Registeration Sucessfull! ",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.black,
                        textColor: Colors.white,
                        fontSize: 20,
                      );

  final _dbref = FirebaseDatabase.instance.reference();
  _dbref.child("citizen/${widget._citizen.mobileno}").set({
    'name': widget._citizen.name,
    'age': widget._citizen.age,
    'occupation': widget._citizen.occupation,
    'mobileno': widget._citizen.mobileno,
    'pincode': widget._citizen.pincode,
    'houseno': widget._citizen.houseno,
    'aadharcardno': widget._citizen.aaharcardno,
    'state': widget._citizen.state,
    'streetname': widget._citizen.streetname,
    'date': DateTime.now().toString(),
    'isbooked': widget._citizen.isbooked,
    'isvaccinated': widget._citizen.isvaccinated,
    'isrequestbooking': widget._citizen.isrequestbooking,
    'placebooked': "none",
    'isbadge1': widget._citizen.isbadge1,
    'isbadge2': widget._citizen.isbadge2,
    'isbadge3':widget._citizen.isbadge3,
    'isbadge4':widget._citizen.isbadge4,
    'isbadge5': widget._citizen.isbadge5,
    'badgeno': widget._citizen.badgeno,
  }).then((onValue) {
    print(' otp sucess upload data ');
  
     Navigator.pushReplacementNamed(
                          context, CitizenHomePage.routename,
                          arguments: widget._citizen);
  });
                    }
                  });

                } catch (e) {
                  FocusScope.of(context).unfocus();
                  _scaffoldkey.currentState
                      .showSnackBar(SnackBar(content: Text('invalid OTP')));
                }
              },
            ),
          )
        ],
      ),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget._citizen.mobileno}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Fluttertoast.showToast(
                msg: "Registeration Sucessfull! ",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.blueGrey[900],
                textColor: Colors.white,
                fontSize: 20,
              );

   final _dbref = FirebaseDatabase.instance.reference();
  _dbref.child("citizen/${widget._citizen.mobileno}").set({
    'name': widget._citizen.name,
    'age': widget._citizen.age,
    'occupation': widget._citizen.occupation,
    'mobileno': widget._citizen.mobileno,
    'pincode': widget._citizen.pincode,
    'houseno': widget._citizen.houseno,
    'aadharcardno': widget._citizen.aaharcardno,
    'state': widget._citizen.state,
    'streetname': widget._citizen.streetname,
    'date': DateTime.now().toString(),
    'isbooked': widget._citizen.isbooked,
    'isvaccinated': widget._citizen.isvaccinated,
    'isrequestbooking': widget._citizen.isrequestbooking,
    'placebooked': "none",
    'isbadge1': widget._citizen.isbadge1,
    'isbadge2': widget._citizen.isbadge2,
    'isbadge3':widget._citizen.isbadge3,
    'isbadge4':widget._citizen.isbadge4,
    'isbadge5': widget._citizen.isbadge5,
    'badgeno': widget._citizen.badgeno,
  }).then((onValue) {
    print(' otp sucess upload data ');
  
     Navigator.pushReplacementNamed(
                          context, CitizenHomePage.routename,
                          arguments: widget._citizen);
  });

            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String verficationID, int resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    super.initState();
    _verifyPhone();
  }
}
