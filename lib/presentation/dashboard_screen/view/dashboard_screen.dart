import 'package:flutter/material.dart';
import 'package:task_tracker/core/app_export.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 10.h, right: 10.h, top: 30.v),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Hello!"),
          Text("What's your plan for today?"),
          Text("Track Summary"),
          Text("Tasks for the Day"),
        ]),
      ),
    );
  }
}
