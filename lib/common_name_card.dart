import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommonNameCard extends StatelessWidget {
  final String cardTitle;
  final String cardDescription;
  final String imageAsset;

  const CommonNameCard({
    Key? key,
    this.cardTitle = "",
    this.cardDescription = "",
    this.imageAsset = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 10.0,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.arrow_drop_down_circle),
              title: Text(cardTitle),
              subtitle: Text(
                cardDescription,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.start,
              children: [
                TextButton(
                  style: TextButton.styleFrom(primary: const Color(0xFF6200EE)),
                  onPressed: () {
                    // Perform some action
                    print("Action 1 Clicked");
                  },
                  child: const Text('ACTION 1'),
                ),
                TextButton(
                  style: TextButton.styleFrom(primary: const Color(0xFF6200EE)),
                  onPressed: () {
                    // Perform some action
                    print("Action 2 Clicked");
                  },
                  child: const Text('ACTION 2'),
                ),
              ],
            ),
            Stack(
              children: [
                Image.asset(imageAsset),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: IconButton(
                    onPressed: () {
                      print("Icon ADB Clicked");
                    },
                    icon: Icon(
                      Icons.adb,
                      color: Colors.greenAccent,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
