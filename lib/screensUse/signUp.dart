import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:giveandgetblood/nuility/normal_Dialog.dart';
import 'package:giveandgetblood/screensUse/login.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //field
  String email, password, confpassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          BlackButtonWidget(),

          //
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.mail), onPressed: null),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 20, left: 10),
                  child: TextField(
                    onChanged: (value) => email = value.trim(),
                    decoration: InputDecoration(hintText: 'Email'),
                  ),
                ))
              ],
            ),
          ),

          //
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.lock), onPressed: null),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 20, left: 10),
                  child: TextField(
                    obscureText: true,
                    onChanged: (value) => password = value.trim(),
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                ))
              ],
            ),
          ),

          //
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.lock), onPressed: null),
                Expanded(
                    child: Container(
                  margin: EdgeInsets.only(right: 20, left: 10),
                  child: TextField(
                    onChanged: (value) => confpassword = value.trim(),
                    obscureText: true,
                    decoration: InputDecoration(hintText: 'Confirm password'),
                  ),
                ))
              ],
            ),
          ),

          //
          SizedBox(
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 60,
                child: RaisedButton(
                  onPressed: () {
                    if (password == null ||
                        password.isEmpty ||
                        email == null ||
                        email.isEmpty ||
                        confpassword == null ||
                        confpassword.isEmpty) {
                      normalDialog(context, 'Please fill in all fields.');
                    } else if (password != confpassword ||
                        confpassword != password &&
                        password.length >= 6) {
                      normalDialog(context, 'Password mismatch.');
                    } else {
                      checksighin();
                    }
                  },
                  color: Colors.orange[900],
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> checksighin() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((user) {
      print("Sign up user successful.");
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Login());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    }).catchError((error) {
      normalDialog(context, 'กรุณากรอกข้อมูลใหม่');
    });
  }
}

class BlackButtonWidget extends StatelessWidget {
  const BlackButtonWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('images/Ib.jpg'))),
      child: Positioned(
          child: Stack(
        children: <Widget>[
          Positioned(
              top: 20,
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        MaterialPageRoute route =
                            MaterialPageRoute(builder: (value) => Login());
                        Navigator.push(context, route);
                      })
                ],
              )),
          Positioned(
            bottom: 20,
            child: Text(
              '  Create New Account',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ],
      )),
    );
  }
}
