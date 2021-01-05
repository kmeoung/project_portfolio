import 'package:flutter/material.dart';
import 'package:portfolio/common_data.dart';
import 'package:portfolio/screen/screen_main.dart';

class ScreenSplash extends StatelessWidget {
  Future replacePage(BuildContext context) async {
    await Future.delayed(
      Duration(seconds: 3),
    );
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScreenMain(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    replacePage(context);

    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Text(
            LOGO_TITLE.toUpperCase(),
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
