import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:module_ifsi_flutter/feature/form_validation/FormInputValidation.dart';
import 'package:module_ifsi_flutter/feature/image_picker/image_picker_section.dart';
import 'package:module_ifsi_flutter/feature/login/login_section.dart';

class HomepageBody extends StatefulWidget {
  const HomepageBody({Key? key}) : super(key: key);

  @override
  _HomepageBodyState createState() => _HomepageBodyState();
}

class _HomepageBodyState extends State<HomepageBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            _buildLoginSection(context),
            SizedBox(height: 10),
            _buildFormInputValidation(),
            SizedBox(height: 10),
            _buildImagePickerSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginSection(BuildContext context) {
    return Column(
      children: [
        Text("Login Section"),
        SizedBox(height: 10),
        LoginSection(),
      ],
    );
  }

  Widget _buildFormInputValidation() {
    return Column(
      children: [
        Divider(
          height: 2,
          thickness: 2.0,
        ),
        SizedBox(height: 10),
        Text("Form Input Validation Section"),
        SizedBox(height: 10),
        FormInputValidation(),
      ],
    );
  }

  Widget _buildImagePickerSection() {
    return Column(
      children: [
        Divider(
          height: 2,
          thickness: 2.0,
        ),
        SizedBox(height: 10),
        Text("ImagePicker Section"),
        SizedBox(height: 10),
        ImagePickerSection(),
      ],
    );
  }
}
