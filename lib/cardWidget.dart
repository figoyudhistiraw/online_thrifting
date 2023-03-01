import 'package:flutter/material.dart';
import 'show.dart';

Widget cardPost(BuildContext context) {
  return // card 1
      Container(
    margin: const EdgeInsets.all(15.0),
    height: 371,
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
          height: 200,
          color: Colors.grey,
          child: const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Image",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ),
        ),
        Container(
          height: 44,
          color: const Color.fromARGB(125, 3, 172, 14),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Rp 30.000",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ),
        Container(
          height: 50,
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Lorem ipsum dolor sit amet",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ),
        ),
        Container(
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Surabaya, Indonesia",
                style: TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 115, 115, 115)),
              ),
            ),
          ),
        ),
        ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ShowPage()),
            );
          },
        ),
      ],
    ),
  );
}
