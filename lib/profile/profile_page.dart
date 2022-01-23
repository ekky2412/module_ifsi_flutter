import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatefulWidget {
  final String username;

  const ProfilePage({
    required this.username,
    Key? key,
  }) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile Page"),
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: "Cat"),
              Tab(text: "Dog"),
              Tab(text: "Chicken"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Text("Cat"),
            Text("Dog"),
            Text("Chicken"),
          ],
        ),
      ),
    );
  }
}
