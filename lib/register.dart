import 'package:flutter/material.dart';

class RegisterWidget extends StatelessWidget {
  const RegisterWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            // account info
            Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: [
                  // account / profile picture
                  Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage("images/image1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: null /* add child content here */,
                  ),
                  // account name
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(
                              "Account Name",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 26, color: Color(0xff03ac0e)),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.0),
                            child: Text(
                              "View and Edit Profile",
                              style: TextStyle(
                                  fontSize: 18, color: Color(0xff03ac0e)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Account (login or register)
            Container(
              margin: EdgeInsets.all(15),
              height: 48,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xff03ac0e)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Icon(Icons.settings),
                  ),
                  Container(
                    child: Column(
                      children: const [
                        Text(
                          "Accounts",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text("Login or Register")
                      ],
                    ),
                  ),
                  Container(
                    child: Icon(Icons.arrow_forward_ios),
                  )
                ],
              ),
            ),
            // Contact us
            Container(
              margin: EdgeInsets.all(15),
              height: 48,
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xff03ac0e)),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Icon(Icons.contact_support),
                  ),
                  Container(
                    child: Column(
                      children: const [
                        Text(
                          "Contact Us",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Text("Call or Message")
                      ],
                    ),
                  ),
                  Container(
                    child: Icon(Icons.arrow_forward_ios),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
