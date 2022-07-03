import 'package:flutter/material.dart';
import 'package:testui/Views/GeneralStatus/GeneralStatus.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../Views/History/History.dart';
import '../Constants/AppColor.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  // InterstitialAd? _interstitialAd;

  // void createInterstitialAd() {
  //   InterstitialAd.load(
  //     adUnitId: 'ca-app-pub-3758376075258060/3424860606',
  //     request: AdRequest(),
  //     adLoadCallback: InterstitialAdLoadCallback(
  //       onAdLoaded: (InterstitialAd ad) {
  //         _interstitialAd = ad;
  //       },
  //       onAdFailedToLoad: (LoadAdError error) {
  //         _interstitialAd = null;
  //         createInterstitialAd();
  //       },
  //     ),
  //   );
  // }

  // void showInterstitialAd() {
  //   if (_interstitialAd != null) {
  //     _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
  //       onAdDismissedFullScreenContent: (InterstitialAd ad) {
  //         ad.dispose();
  //         createInterstitialAd();
  //       },
  //       onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
  //         ad.dispose();
  //         createInterstitialAd();
  //       },
  //     );
  //     _interstitialAd!.show();
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.orange,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            DrawerHeader(
              child: Container(
                  height: 142,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/welcomevectorlogo.png",
                  )),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => CostTimeLine()));
              },
              child: Text(
                'CostTimeLine',
                style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accent),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            GestureDetector(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GeneralStatus()),
                );
              },
              child: Text(
                'GeneralStatus',
                style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accent),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            GestureDetector(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => History()),
                );
              },
              child: Text(
                'History',
                style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accent),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            GestureDetector(
              onTap: () async {},
              child: Text(
                'Support',
                style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accent),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
            GestureDetector(
              onTap: () async {},
              child: Text(
                'Contact',
                style: TextStyle(
                    fontFamily: 'Avenir',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accent),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 45,
            ),
          ],
        ),
      ),
    );
  }
}
