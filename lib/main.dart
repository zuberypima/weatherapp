import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app_tutorial/screens/authScreen/login_page.dart';
import 'package:weather_app_tutorial/screens/authScreen/registration_page.dart';
import 'package:weather_app_tutorial/screens/emergency_contact.dart';
import 'package:weather_app_tutorial/screens/mapDetailed.dart';
import 'package:weather_app_tutorial/screens/rain_flood_tips.dart';
import 'package:weather_app_tutorial/screens/safety_tips.dart';
import 'package:weather_app_tutorial/screens/share_screen.dart';
import 'package:weather_app_tutorial/services/authenticationServices.dart';
import '/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyBGD2v9jKvH1x2mkCaOtkJ9q7IEjapCpxo",
          appId: "1:965249424170:android:d2034a674ecafccda05c53",
          messagingSenderId: "965249424170",
          projectId: "weatherapp-639c9"));
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: FutureBuilder(
      //     future: Authenticationservices().getCurrentUser(),
      //     builder: (context, AsyncSnapshot snapshot) {
      //       if (snapshot.connectionState == ConnectionState.done) {
      //         if (snapshot.hasData) {
      //           return HomeScreen();
      //           // HomePage();
      //         }
      //         return LoginPage();
      //       }
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     })
      home:
          // Mapdetailed()
          HomeScreen(),
    );
  }
}
