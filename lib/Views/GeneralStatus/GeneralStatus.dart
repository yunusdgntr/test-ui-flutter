import 'package:flutter/material.dart';

import '../../Core/Constants/AppColor.dart';
import '../../Core/Constants/SpecialText.dart';
import '../../Core/Widgets/AppButton.dart';
import '../../Core/Widgets/InputWidget.dart';

class GeneralStatus extends StatefulWidget {
  @override
  State<GeneralStatus> createState() => _GeneralStatusState();
}

class _GeneralStatusState extends State<GeneralStatus> {
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFavItem(String item, BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Asels",
                        style: TextStyle(fontSize: 20),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("(data)"),
                          Icon(
                            Icons.arrow_upward,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Takip Fiyat",
                            ),
                            Text(
                              "Takip Yaş",
                            ),
                          ],
                        ),
                        flex: 3,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Takip Değişim",
                                ),
                                Icon(
                                  Icons.arrow_downward,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                            Text(
                              "Takip Fiyat",
                            ),
                          ],
                        ),
                        flex: 3,
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text("Tarih:")],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
