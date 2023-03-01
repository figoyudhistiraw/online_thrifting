import 'package:flutter/material.dart';
import 'show.dart';
import 'cardWidget.dart';

class ManagePostWidget extends StatelessWidget {
  const ManagePostWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15.0),
              height: 120,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xff03ac0e),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Container(
                    height: 70,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "Jumlah iklan : 2",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 44,
                    color: const Color.fromARGB(255, 3, 172, 14),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "User_1",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // card 1
            cardPost(context),
            // card 2
            cardPost(context),
          ],
        ),
      ],
    );
  }
}
