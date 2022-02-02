import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:module_ifsi_flutter/view/common_submit_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageLoginSharedPrefs extends StatefulWidget {
  const PageLoginSharedPrefs({Key? key}) : super(key: key);

  @override
  _PageLoginSharedPrefsState createState() => _PageLoginSharedPrefsState();
}

class _PageLoginSharedPrefsState extends State<PageLoginSharedPrefs> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final String usernameDB = "IF";
  final String passwordDB = "IF123";

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Container(
        child: Column(
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: "Username",
              ),
            ),
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            _buildLoginButton(),
            _buildCheckStatusButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return CommonSubmitButton(
      labelButton: "Login",
      submitCallback: (value) {
        String currentUsername = _usernameController.value.text;
        String currentPassword = _passwordController.value.text;

        print("current Username : ${currentUsername}");
        print("current Password : ${currentPassword}");

        _processLogin(currentUsername, currentPassword);
      },
    );
  }

  Widget _buildCheckStatusButton() {
    return CommonSubmitButton(
      labelButton: "Cek Status",
      submitCallback: (value) {
        _processCheckStatus();
      },
    );
  }

  void _processLogin(String username, String password) async {
    if (username == usernameDB && password == passwordDB) {
      SharedPreferences getPreferences = await _prefs;
      bool status = await getPreferences.setBool("loginStatus", true);
      print("Login Success");
      print("Current Status $status");
    } else {
      print("Login Failed");
    }
  }

  void _processCheckStatus() async {
    SharedPreferences getPreferences = await _prefs;
    bool status = getPreferences.getBool("loginStatus") ?? false;
    print("Current Status $status");
  }
}
