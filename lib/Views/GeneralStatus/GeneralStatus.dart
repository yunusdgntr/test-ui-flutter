import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Core/Constants/AppColor.dart';
import '../../Core/Constants/SpecialText.dart';
import '../../Core/Widgets/AppButton.dart';
import '../../Core/Widgets/InputWidget.dart';
import '../../count_up.dart';

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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'General Status',
          style: SpecialText().getKanik(25, FontWeight.bold, Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return StatusCard('BASLIK', 15064242.5, '₺');
            },
            itemCount: 10,
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

class StatusCard extends StatelessWidget {
  String title;
  double number;
  String suffix;

  StatusCard(this.title, this.number, this.suffix);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: SpecialText().getKanik(20, null, Colors.black),
            ),
          ),
          Countup(
            begin: 0.1,
            precision: 2,
            suffix: ' ' + suffix,
            end: number,
            duration: const Duration(seconds: 1),
            separator: '',
            style: TextStyle(
              fontSize: 30,
              color: Colors.black.withOpacity(0.8),
            ),
          )
        ]),
      ),
    );
  }
}
