import 'package:flutter/material.dart';
import 'package:testui/Views/Login/Login.dart';
import 'package:testui/Views/Register/service/RegisterService.dart';

import '../../Core/Constants/AppColor.dart';
import '../../Core/Constants/SpecialText.dart';
import '../../Core/Widgets/AppButton.dart';
import '../../Core/Widgets/InputPassWidget.dart';
import '../../Core/Widgets/InputWidget.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController userNameController;
  late TextEditingController fullNameController;
  late TextEditingController mailController;
  late TextEditingController passwordController;
  int activeIndex = 0;

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
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                // Image.asset('assets/images/createaccount.png'),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'CreateAccount',
                  style: SpecialText().getMainHeader(
                      25, FontWeight.bold, AppColors.darkThemeShadowColor),
                ),
                SizedBox(
                  height: 40,
                ),
                InputWidget(
                    topLabel: 'UserName',
                    hintText: 'Username',
                    textEditingController: userNameController),
                SizedBox(
                  height: 10,
                ),
                InputWidget(
                    topLabel: 'FullName',
                    hintText: 'FullName',
                    textEditingController: fullNameController),
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
                  height: 15,
                ),
                AppButton(
                  height: 50,
                  type: ButtonType.PRIMARY,
                  buttonTextColor: Colors.black,
                  onPressed: () async {
                    var service = RegisterService();
                    var result = await service.registerUser('username', '', '');
                  },
                  text: 'Save',
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
                        "ZatenHesabımVar",
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
