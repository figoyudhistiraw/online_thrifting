import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:thriftnstash/providers/user_provider.dart';
import 'package:thriftnstash/screens/menu/account.dart';
import 'package:thriftnstash/screens/menu/ads.dart';
import 'package:thriftnstash/screens/menu/home.dart';
import 'package:thriftnstash/screens/menu/sell.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

final FirebaseAuth _auth = FirebaseAuth.instance;

class _MainPageState extends State<MainPage> {
  final pages = [
    HomePage(),
    SellPage(),
    AdsPage(),
    AccountPage(),
  ];
  int selectedIndex = 0;
  void onTap(int index) {
    setState(() {
      selectedIndex = index;
      print(_auth.currentUser!.uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of(context, listen: false);
    userProvider.refreshUser();
    return
        // Consumer<UserProvider>(builder: (context, userData, child) {
        Scaffold(
      resizeToAvoidBottomInset: false,
      
      bottomNavigationBar: FloatingNavbar(
        borderRadius: 20,
        backgroundColor: Color(0xFF4CAF50),
        selectedItemColor: Colors.green,

        // showSelectedLabels: false,
        // showUnselectedLabels: false,
        items: [
          FloatingNavbarItem(icon: FontAwesomeIcons.store, title: "Home"),
          FloatingNavbarItem(icon: FontAwesomeIcons.plus, title: "Sell"),
          FloatingNavbarItem(
              icon: FontAwesomeIcons.solidHeart, title: "My Ads"),
          FloatingNavbarItem(
              icon: FontAwesomeIcons.solidUser, title: "My Account"),
        ],
        currentIndex: selectedIndex,
        // type: BottomNavigationBarType.fixed,
        onTap: onTap,
      ),
      body: pages.elementAt(selectedIndex),
    );
  }
}
// actions: <Widget>[
      //   Padding(
      //     padding: const EdgeInsets.all(10.0),
      //     child: FilledButton(
      //       onPressed: () async {
      //         await AuthService.signOut();
      //       },
      //       child: Icon(Icons.output),
      //     ),
      //   )
      // ],

      // title: TextField(
      //   style: TextStyle(color: Colors.white),
      //   cursorColor: Colors.white,
      //   decoration: InputDecoration(
      //     hintText: 'Search...',
      //     hintStyle: TextStyle(color: Colors.white54),
      //     icon: Icon(
      //       Icons.search,
      //       color: Colors.white,
      //     ),
      //     border: InputBorder.none,
      //   ),
      // ),


// return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("Home Screen"),
//             ElevatedButton(
//                 onPressed: () async {
//                   final message = await AuthService.signOut();
//                   ScaffoldMessenger.of(context)
//                       .showSnackBar(SnackBar(content: Text(message)));
//                 },
//                 child: Text("Sign Out"))
//           ],
//         ),
//       ),
//     );

      //     bottomNavigationBar:
      //         BottomNavigationBar(items: <BottomNavigationBarItem>[
      //   BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //   BottomNavigationBarItem(icon: Icon(Icons.sell), label: "Sell"),
      //   BottomNavigationBarItem(
      //       icon: Icon(Icons.favorite_outlined), label: "My Ads"),
      //   BottomNavigationBarItem(icon: Icon(Icons.person), label: "My Account"),
      // ]
      // ),