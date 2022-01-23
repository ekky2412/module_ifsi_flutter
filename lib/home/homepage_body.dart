import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:module_ifsi_flutter/common_submit_button.dart';
import 'package:module_ifsi_flutter/feature/image_picker_section.dart';
import 'package:module_ifsi_flutter/profile/profile_page.dart';

class HomepageBody extends StatefulWidget {
  const HomepageBody({Key? key}) : super(key: key);

  @override
  _HomepageBodyState createState() => _HomepageBodyState();
}

class _HomepageBodyState extends State<HomepageBody> {
  int value = 0;

  String username = "Rama";
  String password = "123456";
  String isLoginSuccess = "";

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLoginSection(context),
          SizedBox(height: 10),
          _formInput(
            hint: "Masukkan Nama Lengkap",
            label: "Nama *",
            setStateInput: (value) {
              setState(() {
                print(value);
              });
            },
          ),
          SizedBox(height: 10),
          _buildImagePickerSection(),
        ],
      ),
    );
  }

  Widget _formInput(
      {required String hint,
      required String label,
      required Function(String value) setStateInput,
      int maxLines = 1}) {
    return TextFormField(
      enabled: true,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label,
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
      onChanged: setStateInput,
    );
  }

  Widget _buildLoginSection(BuildContext context) {
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
        ElevatedButton(
            onPressed: () {
              setState(() {});
            },
            child: Text("Button"))
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

  Widget _buildImagePickerSection() {
    return ImagePickerSection();
  }
}
