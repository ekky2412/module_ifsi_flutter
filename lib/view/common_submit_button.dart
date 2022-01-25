import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CommonSubmitButton extends StatelessWidget {
  final String labelButton;
  final Function(String) submitCallback;

  const CommonSubmitButton({
    Key? key,
    required this.labelButton,
    required this.submitCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Common Submit Button $labelButton Trigerred");
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        child: Text(labelButton),
        onPressed: () {
          submitCallback(labelButton);
        },
      ),
    );
  }
}
