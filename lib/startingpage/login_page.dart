import 'package:flutter/material.dart';
import 'package:thriftnstash/startingpage/login_field.dart';
import 'package:thriftnstash/startingpage/register_field.dart';

class LogPage extends StatefulWidget {
  LogPage({super.key});

  @override
  State<LogPage> createState() => LogPageState();
}

class LogPageState extends State<LogPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
    
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                        child: Image.asset(
                      scale: 3.6,
                      "images/thrift.png",
                      fit: BoxFit.cover,
                    )),
                  ],
                ),
              ),

              // Divider(),
              // Container(
              //   decoration: BoxDecoration(border: Border.all(width: 1)),
              //   height: 300,
              //   width: 300,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Text("LOGO THRIFT STASH"),
              //     ],
              //   ),
              // ),
              Divider(),
              Container(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return SignIn();
                    }));
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
                height: 50,
                width: 300,
                child: OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return SignUp();
                    }));
                  },
                  child: Text(
                    "SIGN UP",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              // Container(
              //   height: 50,
              //   width: 300,
              //   decoration:
              //       BoxDecoration(borderRadius: BorderRadius.circular(100)),
              //   child: OutlinedButton(
              //     style: ElevatedButton.styleFrom(
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10))),
              //     onPressed: () async {
              //       await AuthService.signInAnon();
              //     },
              //     child: Text(
              //       "GUEST",
              //       style: TextStyle(fontSize: 15),
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}


      // Column(
      //   children: [
      //     Text("Email"),
      //     Padding(
      //       padding: EdgeInsets.all(20.0),
      // child: TextFormField(
      //   decoration: InputDecoration(
      //       label: Text("Masukkan Email"),
      //       border: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(10))),
      //       ),
      //     ),
      //     Column(
      //       children: [
      //         Text("Password"),
      //         Padding(
      //           padding: EdgeInsets.all(20.0),
      //           child: TextFormField(
      //             obscureText: true,
      //             decoration: InputDecoration(
      //                 label: Text("Masukkan Password"),
      //                 border: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(10))),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),