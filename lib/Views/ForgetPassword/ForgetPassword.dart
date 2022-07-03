import 'package:flutter/material.dart';
import 'package:testui/Views/ForgetPassword/RecoveryPassword.dart';

import '../../Core/Constants/AppColor.dart';
import '../../Core/Constants/SpecialText.dart';
import '../../Core/Widgets/AppButton.dart';
import '../../Core/Widgets/InputWidget.dart';

class ForgetPassword extends StatefulWidget {
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
          padding: EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset('assets/images/welcomevectorlogo.png'),
                Text(
                  'ForgetPassword',
                  style: SpecialText()
                      .getMainHeader(25, FontWeight.bold, AppColors.accent),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  height: 10,
                ),
                InputWidget(
                    topLabel: 'Email',
                    hintText: 'Email',
                    textEditingController: mailController),
                SizedBox(
                  height: 25,
                ),
                AppButton(
                  height: 50,
                  type: ButtonType.PRIMARY,
                  onPressed: () async {},
                  text: 'Send',
                  buttonTextColor: Colors.black,
                ),
                SizedBox(
                  height: 50,
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
                                    RecoveryPassword()));
                      },
                      child: Text(
                        "Giriş Yap",
                        textAlign: TextAlign.right,
                        style: SpecialText()
                            .getDidact(20, FontWeight.bold, AppColors.accent),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
