import 'package:flutter/material.dart';
import 'home.dart';
import 'register.dart';
import 'newPost.dart';
import 'managePost.dart';

void main() {
  runApp(const MaterialApp(
    title: 'Online Thrifting',
    home: HomePage(),
  ));
}

int _index = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
    NewPostWidget(),
    ManagePostWidget(),
    RegisterWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Home Page'),
        backgroundColor: const Color(0xff03ac0e),
      ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          backgroundColor: const Color(0xff03ac0e),
          unselectedItemColor: Colors.white70,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Beranda",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.arrow_circle_up), label: "Post Iklan"),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: "My Post"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle), label: "Akun"),
          ]),
    );
  }
}
