import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testui/Core/Constants/SpecialText.dart';
import 'package:testui/Core/Widgets/DrawerWidget.dart';
import 'package:testui/Views/ForgetPassword/ForgetPassword.dart';
import 'package:testui/Views/Home/Home.dart';

import '../../fav.dart';
import '../../stateful_dialog.dart';
import '../../wallet.dart';

class Navigationpage extends StatefulWidget {
  const Navigationpage({Key? key}) : super(key: key);

  @override
  State<Navigationpage> createState() => _NavigationpageState();
}

class _NavigationpageState extends State<Navigationpage> {
  final globalKey = GlobalKey<ScaffoldState>();
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text(
          'Borsam',
          style: SpecialText().getKanik(25, FontWeight.bold, Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.arrow_clockwise,
              color: Colors.white,
              size: 30,
            ),
          )
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.ease,
        backgroundColor: Color.fromRGBO(245, 247, 249, 1),
        buttonBackgroundColor: Colors.orange,
        items: [
          SvgPicture.asset('assets/icons/home2.svg',
              width: 30,
              height: 30,
              color: activeIndex == 0
                  ? Colors.white
                  : Color.fromARGB(255, 105, 108, 114)),
          SvgPicture.asset('assets/icons/mapicon.svg',
              width: 30,
              height: 30,
              color: activeIndex == 1 ? Colors.white : Color(0xFFC8C9CB)),
          SvgPicture.asset('assets/icons/add-circle.svg',
              width: 30,
              height: 30,
              color: activeIndex == 2 ? Colors.white : Color(0xFFC8C9CB)),
          SvgPicture.asset('assets/icons/add-circle.svg',
              width: 30,
              height: 30,
              color: activeIndex == 3 ? Colors.white : Color(0xFFC8C9CB)),
        ],
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
      ),
      body: getViewForIndex(activeIndex),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return Home();
      case 1:
        return TrackList();

      case 2:
        return Wallet();
      default:
        return Portfolio();
    }
  }
}
