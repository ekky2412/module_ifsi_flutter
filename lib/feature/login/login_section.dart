import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:module_ifsi_flutter/profile/profile_page.dart';
import 'package:module_ifsi_flutter/view/common_submit_button.dart';

class LoginSection extends StatefulWidget {
  const LoginSection({Key? key}) : super(key: key);

  @override
  _LoginSectionState createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  String username = "Rama";
  String password = "123456";
  String isLoginSuccess = "";

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12),
        _buildUsernameField(),
        SizedBox(height: 12),
        _buildPasswordField(),
        SizedBox(height: 12),
        _buildLoginButton(context),
        SizedBox(height: 12),
        _buildRegisterButton(context),
      ],
    );
  }

  Widget _buildUsernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        enabled: true,
        controller: _usernameController,
        decoration: InputDecoration(
          hintText: 'Username',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: (isLoginSuccess != "gagal") ? Colors.blue : Colors.red,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: (isLoginSuccess != "gagal") ? Colors.blue : Colors.red,
              width: 1.0,
            ),
          ),
        ),
        onChanged: (value) {},
      ),
    );
  }

  Widget _buildPasswordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: _passwordController,
        enabled: true,
        decoration: InputDecoration(
          hintText: 'Password',
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: (isLoginSuccess != "gagal") ? Colors.blue : Colors.red,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: (isLoginSuccess != "gagal") ? Colors.blue : Colors.red,
              width: 1.0,
            ),
          ),
        ),
        onChanged: (value) {},
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return CommonSubmitButton(
      labelButton: "Login Dulu",
      submitCallback: (value) {
        print("Callback Value - $value");
        if (_usernameController.text == username &&
            _passwordController.text == password) {
          setState(() {
            print("Login Success");
            isLoginSuccess = "sukses";
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(
                  username: username,
                ),
              ),
            );
          });
        } else {
          setState(() {
            print("Login Gagal");
            isLoginSuccess = "gagal";
          });
        }
      },
    );
  }

  Widget _buildRegisterButton(BuildContext context) {
    return CommonSubmitButton(
      labelButton: "Register Dulu Ya",
      submitCallback: (value) {
        print("Callback Value - $value");
      },
    );
  }
}
