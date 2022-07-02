import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

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
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            DrawerHeader(
              child: Container(
                  height: 142,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/findmycarlogo.jpeg",
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
                    fontSize: 24,
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
                    fontSize: 24,
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
                    fontSize: 24,
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
