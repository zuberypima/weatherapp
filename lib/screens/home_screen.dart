import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/screens/rain_flood_tips.dart';
import 'package:weather_app_tutorial/screens/safety_tips.dart';

import '/constants/app_colors.dart';
import '/screens/forecast_report_screen.dart';
import '/screens/search_screen.dart';
import '/screens/settings_screen.dart';
import 'weather_screen/weather_screen.dart';
import '/services/api_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;

  final _screens = [
    WeatherScreen(),
    SearchScreen(),
    ForecastReportScreen(),
    SafetyTips(),
    // FeedsScreen(),
  ];

  @override
  void initState() {
    ApiHelper.getCurrentWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                child: DrawerHeader(child: drawerProfile())),
            TextButton(onPressed: () {}, child: Text("Emergency")),
            TextButton(onPressed: () {}, child: Text("Safety Tips"))
          ],
        ),
      ),
      body: _screens[_currentPageIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(4, 138, 138, 0.766),
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentPageIndex,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: AppColors.grey,
          onTap: ontapScreen,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Cities'),
            BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Report'),
            BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined), label: 'Tips'),
          ]),
      // ),
    );
  }

  ontapScreen(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }
}

Widget drawerProfile() {
  return FutureBuilder<DocumentSnapshot>(
    future: FirebaseFirestore.instance
        .collection('UserDetails')
        .doc(FirebaseAuth.instance.currentUser?.email.toString())
        .get(),
    builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
      if (snapshot.hasError) {
        return Text("Something went wrong");
      }

      if (snapshot.connectionState == ConnectionState.done) {
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Icon(Icons.person),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("User: ${data['FullName']}"),
                    Text("Emaile: ${data['Email']}"),
                  ],
                ),
              ],
            ),
          ],
        );
      }

      return Text("loading");
    },
  );
}
