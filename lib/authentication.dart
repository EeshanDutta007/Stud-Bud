import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stud_bud/Pages/NavBar.dart';
import 'main.dart';

String select = "Student";
String email = '';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  CollectionReference userRefrence =
      FirebaseFirestore.instance.collection('Users');
  String password = '';
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);
  Future<String> _loginUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: select == "Student" ? Colors.yellow : Colors.blue,
        accentColor: Colors.white,
        cursorColor: Colors.white,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              height: h / 1.2,
              width: w,
              child: RotatedBox(
                quarterTurns: 0,
                child: FlareActor(
                  select == "Student"
                      ? 'assets/auth yellow flare.flr'
                      : 'assets/auth blue flare.flr',
                  animation: 'Flow',
                  alignment: Alignment.bottomCenter,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: w / 4, left: w / 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Welcome ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontFamily: 'Fredoka One',
                    ),
                  ),
                  Text(
                    "Back ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontFamily: 'Fredoka One',
                    ),
                  ),
                ],
              ),
            ),
            FlutterLogin(
              emailValidator: (value) {
                if (!value.contains('@') || !value.endsWith('.com')) {
                  return "Email must contain '@' and end with '.com'";
                }
                return null;
              },
              passwordValidator: (value) {
                if (value.isEmpty) {
                  return 'Password is empty';
                }
                return null;
              },
              onLogin: (loginData) async {
                email = loginData.name;
                password = loginData.password;
                try {
                  final prefs = await SharedPreferences.getInstance();
                  UserCredential newUser = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email, password: password);
                  userRefrence
                      .doc(email.substring(0, email.indexOf('@')))
                      .get()
                      .then((DocumentSnapshot documentSnapshot) {
                    if (documentSnapshot.exists) {
                      var select1 = documentSnapshot.data()['select'];
                      //  CircleAvtarImage=link.toString();
                      if (select1 == select && select == 'Tutor') {
                        prefs.setString('stud_bud_email', email);
                        prefs.setString('student_tutor', select1);
                        main();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SideNavBar()));
                      } else if (select1 == select && select == 'Student') {
                        prefs.setString('stud_bud_email', email);
                        prefs.setString('student_tutor', select1);
                        main();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SideNavBar()));
                      } else {
                        print('Correct the credentials');
                      }
                    } else {
                      print('unsucsessful');
                    }
                  });
                } catch (e) {
                  print(e);
                }
                return _loginUser(loginData);
              },
              onSignup: (loginData) async {
                email = loginData.name;
                password = loginData.password;
                try {
                  final newUser = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: email, password: password);
                  userRefrence
                      .doc(email.substring(0, email.indexOf('@')))
                      .set({
                        'Email': email,
                        'select': select,
                      })
                      .then((value) => print('user Added'))
                      .catchError((error) => print('Failed to add'));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Authentication()));
                } catch (e) {
                  print(e);
                }
                return _loginUser(loginData);
              },
              onRecoverPassword: (email) {
                //reset pw of email
                return _recoverPassword(email);
              },
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(right: .1 * w, top: .10 * h),
                child: Column(
                  children: [
                    Text('Account',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Fredoka One')),
                    Text('Type',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Fredoka One')),
                    SizedBox(
                      height: 15,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.0))),
                      elevation: 0.5,
                      color: Colors.transparent,
                      child: Container(
                        width: .225 * w,
                        height: .075 * h,
                        child: Align(
                          alignment: select == "Student"
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            width: .07 * h,
                            height: .1 * w,
                            child: Center(
                              child: Text(
                                select,
                                style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black,
                                  fontFamily: 'Fredoka One',
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (select == "Student")
                            select = "Tutor";
                          else
                            select = "Student";
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Authentication()));
                        });
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class LoggedInWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         alignment: Alignment.center,
//         color: Colors.white,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Logged In',
//               style: TextStyle(color: Colors.black),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Email: ' + email,
//               style: TextStyle(color: Colors.black),
//             ),
//             SizedBox(height: 8),
//             Text(
//               'Account: ' + acc,
//               style: TextStyle(color: Colors.black),
//             ),
//             SizedBox(height: 24),
//             Text(
//               '👉👌',
//               style: TextStyle(color: Colors.black, fontSize: 64),
//             ),
//             SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: () async {
//                 FirebaseAuth.instance.signOut();
//                 final prefs = await SharedPreferences.getInstance();
//                 prefs.remove('stud_bud_email');
//                 prefs.remove('student_tutor');
//                 main();
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => Authentication()));
//               },
//               child: Text('Logout'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
