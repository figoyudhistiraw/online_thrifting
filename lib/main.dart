import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:thriftnstash/screens/main_page.dart';
import 'package:thriftnstash/startingpage/login_page.dart';
import 'providers/user_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Thrift & Stash",
          theme: ThemeData(
              primaryTextTheme: TextTheme(headlineMedium: TextStyle()),
              listTileTheme: ListTileThemeData(iconColor: Color(0xFF4CAF50)),
              colorScheme: ColorScheme.light(
                primary: const Color(0xFF4CAF50), // 0xFFb68d40
              ),
              textTheme: GoogleFonts.robotoTextTheme(
                Theme.of(context).textTheme,
              )),
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                User? user = snapshot.data;
                if (user == null) {
                  return LogPage();
                } else
                  return MainPage();
              } else {
                return Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ));
  }
}
