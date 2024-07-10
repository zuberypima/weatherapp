import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/providers/strong_wind_tips.dart';
import 'package:weather_app_tutorial/screens/rain_flood_tips.dart';

class SafetyTips extends StatelessWidget {
  const SafetyTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 1.5),
        children: [
          InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => HeavyRainTips()));
              },
              child: tipspageCard('Heavy Cloud ', '11d.png')),
          InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => StrongWindTps()));
              },
              child: tipspageCard('Strong Wind', '11d.png')),
          tipspageCard('Hurricane', '11d.png'),
          tipspageCard('Stom', '11d.png')
        ],
      ),
    );
  }
}

Widget tipspageCard(String tipslabe, imagepath) {
  return Card(
    child: Container(
      decoration: BoxDecoration(
          color: AppColors.secondaryBlack,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: 60,
              width: 60,
              child: Image.asset('assets/icons/' + imagepath)),
          SizedBox(
            height: 5,
          ),
          Text(
            tipslabe,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    ),
  );
}
