import 'package:flutter/material.dart';
import 'package:treva/screen/Home/GrandientAppBar.dart';
import 'package:treva/screen/Home/HomePageBody.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GradientAppBar("treva"),
          HomePageBody(),
        ],
      ),
    );
  }
}
