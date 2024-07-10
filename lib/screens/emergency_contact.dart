import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/screens/share_screen.dart';

class EmergenceContactPage extends StatefulWidget {
  const EmergenceContactPage({super.key});

  @override
  State<EmergenceContactPage> createState() => _EmergenceContactPageState();
}

class _EmergenceContactPageState extends State<EmergenceContactPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(
                child: Text('Contact'),
              ),
              Tab(
                child: Text('Share'),
              )
            ]),
          ),
          body: TabBarView(
            children: [
              ListView(
                children: [detaildeContainer('category', 'phoneNumber')],
              ),
              ShareDetailScreen()
              // ListView(
              //   children: [detaildeContainer('category', 'phoneNumber')],
              // ),
            ],
          )),
    );
  }
}

Widget detaildeContainer(String category, phoneNumber) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(category),
      Text('0718954678'),
    ],
  );
}
