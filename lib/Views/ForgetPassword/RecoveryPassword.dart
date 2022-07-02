import 'package:flutter/material.dart';

import '../../Core/Constants/AppColor.dart';
import '../../Core/Constants/SpecialText.dart';
import '../../Core/Widgets/AppButton.dart';
import '../../Core/Widgets/InputPassWidget.dart';
import '../../Core/Widgets/InputWidget.dart';
import '../Login/Login.dart';

class RecoveryPassword extends StatefulWidget {
  @override
  State<RecoveryPassword> createState() => _RecoveryPasswordState();
}

class _RecoveryPasswordState extends State<RecoveryPassword> {
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
                  'RecoveryPassword',
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
                    topLabel: 'Token',
                    hintText: 'Token',
                    textEditingController: passwordController),
                SizedBox(
                  height: 25,
                ),
                InputPassWidget(
                    topLabel: 'NewPassword',
                    hintText: 'NewPassword',
                    textEditingController: passwordController),
                SizedBox(
                  height: 25,
                ),
                AppButton(
                  height: 50,
                  type: ButtonType.PRIMARY,
                  onPressed: () async {},
                  text: 'Save',
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
                                builder: (BuildContext context) => Login()));
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
