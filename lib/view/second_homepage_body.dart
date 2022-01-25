import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:module_ifsi_flutter/view/common_button_approve.dart';
import 'package:module_ifsi_flutter/view/common_name_card.dart';

class SecondHomepageBody extends StatefulWidget {
  const SecondHomepageBody({Key? key}) : super(key: key);

  @override
  _SecondHomepageBodyState createState() => _SecondHomepageBodyState();
}

class _SecondHomepageBodyState extends State<SecondHomepageBody> {
  String firstButtonLabel = "1";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CommonButtonApprove(
                buttonLabel: firstButtonLabel,
                buttonCallback: (value) {
                  print("do something with $value");
                  setState(() {
                    int modifyLabel = int.parse(firstButtonLabel);
                    modifyLabel += 1;
                    firstButtonLabel = modifyLabel.toString();
                  });
                },
              ),
              CommonButtonApprove(
                buttonLabel: "Action 2",
                buttonCallback: (value) {
                  print("do something with $value");
                },
              ),
              CommonButtonApprove(
                buttonLabel: "Action 3",
                buttonCallback: (value) {
                  print("do something with $value");
                },
              ),
            ],
          ),
          _buildScrollingSection(),
        ],
      ),
    );
  }

  Widget _buildScrollingSection() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CommonNameCard(
              cardTitle: "Title Card",
              cardDescription: "Description Card",
              imageAsset: "assets/images/gundam.jpeg",
            ),
            CommonNameCard(
              cardTitle: "Title Card",
              cardDescription: "Description Card",
              imageAsset: "assets/images/1.png",
            ),
            CommonNameCard(
              cardTitle: "Title Card",
              cardDescription: "Description Card",
              imageAsset: "assets/images/2.png",
            ),
          ],
        ),
      ),
    );
  }
}
