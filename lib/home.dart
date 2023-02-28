import 'package:flutter/material.dart';
import 'show.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            // card 1
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
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "Image",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 44,
                    color: Color.fromARGB(125, 3, 172, 14),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "Rp 30.000",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "Surabaya, Indonesia",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 115, 115, 115)),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: const Text('Open route'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShowPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
            // card 3
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
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "Image",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 44,
                    color: Color.fromARGB(125, 3, 172, 14),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "Rp 30.000",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "Surabaya, Indonesia",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 115, 115, 115)),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: const Text('Open route'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShowPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
            // card 1
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
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "Image",
                          style: TextStyle(fontSize: 22, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 44,
                    color: Color.fromARGB(125, 3, 172, 14),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "Rp 30.000",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          "Surabaya, Indonesia",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 115, 115, 115)),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: const Text('Open route'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ShowPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
