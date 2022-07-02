import 'package:flutter/material.dart';
import 'package:testui/Core/Constants/SpecialText.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Text(
                      'TEST',
                      style: SpecialText().getDidact(20, null, null),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
