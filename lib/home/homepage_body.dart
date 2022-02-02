import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:module_ifsi_flutter/feature/countries/page_detail_countries.dart';
import 'package:module_ifsi_flutter/feature/form_validation/FormInputValidation.dart';
import 'package:module_ifsi_flutter/feature/image_picker/image_picker_section.dart';
import 'package:module_ifsi_flutter/feature/login/login_section.dart';
import 'package:module_ifsi_flutter/feature/login_shared_prefs/page_login_shared_prefs.dart';
import 'package:module_ifsi_flutter/feature/todo_list/page_todo_list.dart';
import 'package:module_ifsi_flutter/view/common_submit_button.dart';

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
            SizedBox(height: 10),
            _buildCountriesButton(),
            SizedBox(height: 10),
            _buildTodoListButton(),
            SizedBox(height: 10),
            _buildSharedPrefsButton(),
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

  Widget _buildCountriesButton() {
    return CommonSubmitButton(
      labelButton: "See Countries",
      submitCallback: (value) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PageDetailCountries(),
          ),
        );
      },
    );
  }

  Widget _buildTodoListButton() {
    return CommonSubmitButton(
      labelButton: "Todo List",
      submitCallback: (value) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PageTodoList(),
          ),
        );
      },
    );
  }

  Widget _buildSharedPrefsButton() {
    return CommonSubmitButton(
      labelButton: "Shared Preferences",
      submitCallback: (value) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PageLoginSharedPrefs(),
          ),
        );
      },
    );
  }
}
