import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommonButtonApprove extends StatelessWidget {
  final String buttonLabel;
  final Function(String value) buttonCallback;

  const CommonButtonApprove({
    Key? key,
    this.buttonLabel = "",
    required this.buttonCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          buttonCallback(buttonLabel);
        },
        child: Text(buttonLabel),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.red),
          textStyle: MaterialStateProperty.all(
            TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
