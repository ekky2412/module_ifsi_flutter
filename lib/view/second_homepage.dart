import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:module_ifsi_flutter/view/second_homepage_body.dart';

class SecondHomepage extends StatefulWidget {
  const SecondHomepage({Key? key}) : super(key: key);

  @override
  _SecondHomepageState createState() => _SecondHomepageState();
}

class _SecondHomepageState extends State<SecondHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample"),
      ),
      body: SecondHomepageBody(),
    );
  }
}
