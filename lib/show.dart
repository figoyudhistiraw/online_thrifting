import 'package:flutter/material.dart';

class ShowPage extends StatelessWidget {
  const ShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('Show Page'),
          backgroundColor: const Color(0xff03ac0e),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                // card 1
                Container(
                  margin: const EdgeInsets.all(15.0),
                  height: 336,
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Text(
                              "Image",
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        color: Color.fromARGB(125, 3, 172, 14),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Text(
                              "Surabaya, Indonesia",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 115, 115, 115)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // card seller info
                Container(
                  child: Row(
                    children: [
                      Container(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: const EdgeInsets.all(15.0),
                            height: 60,
                            width: 220,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xff03ac0e),
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
                                child: Text(
                                  "Seller Name",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            margin: const EdgeInsets.all(0),
                            height: 60,
                            width: 125,
                            decoration: BoxDecoration(
                              color: const Color(0xff03ac0e),
                              border: Border.all(
                                color: const Color(0xff03ac0e),
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Text(
                                  "Hubungi Penjual",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // card 2
                Container(
                  margin: const EdgeInsets.all(15.0),
                  height: 453,
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
                        height: 44,
                        color: Color.fromARGB(125, 3, 172, 14),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Text(
                              "Kategori Produk",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 44,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Text(
                              "Elektronik",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 44,
                        color: Color.fromARGB(125, 3, 172, 14),
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Text(
                              "Deskripsi Produk",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
