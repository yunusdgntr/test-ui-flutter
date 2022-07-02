import 'package:flutter/material.dart';
import 'package:testui/Views/NavigationPage/NavigationPage.dart';
import 'package:testui/Views/Register/Register.dart';

import '../../Core/Constants/AppColor.dart';
import '../../Core/Constants/SpecialText.dart';
import '../../Core/Widgets/AppButton.dart';
import '../../Core/Widgets/InputPassWidget.dart';
import '../../Core/Widgets/InputWidget.dart';
import '../ForgetPassword/ForgetPassword.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController userNameController;

  late TextEditingController fullNameController;

  late TextEditingController mailController;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController();
    fullNameController = TextEditingController();
    mailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/images/welcomevectorlogo.png'),
                SizedBox(
                  height: 10,
                ),
                InputWidget(
                    topLabel: 'Email',
                    hintText: 'Email',
                    textEditingController: mailController),
                SizedBox(
                  height: 10,
                ),
                InputPassWidget(
                    topLabel: 'Password',
                    hintText: 'Password',
                    textEditingController: passwordController),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => Register()));
                      },
                      child: Text(
                        "Register",
                        textAlign: TextAlign.right,
                        style: SpecialText()
                            .getDidact(15, FontWeight.bold, AppColors.accent),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ForgetPassword()));
                      },
                      child: Text(
                        "ForgetPassword",
                        textAlign: TextAlign.right,
                        style: SpecialText()
                            .getDidact(15, FontWeight.bold, AppColors.accent),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                AppButton(
                  height: 50,
                  type: ButtonType.PRIMARY,
                  onPressed: () async {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                Navigationpage()));
                  },
                  text: 'Login',
                  buttonTextColor: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
