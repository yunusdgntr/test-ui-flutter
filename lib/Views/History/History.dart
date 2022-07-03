import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import '../../Core/Constants/SpecialText.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'History',
          style: SpecialText().getKanik(25, FontWeight.bold, Colors.white),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FixedTimeline.tileBuilder(
                builder: TimelineTileBuilder.connectedFromStyle(
                  contentsAlign: ContentsAlign.basic,
                  oppositeContentsBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('opposite\ncontents'),
                  ),
                  contentsBuilder: (context, index) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Contents',
                        style:
                            SpecialText().getBuble(30, FontWeight.bold, null),
                      ),
                    ),
                  ),
                  connectorStyleBuilder: (context, index) =>
                      ConnectorStyle.dashedLine,
                  indicatorStyleBuilder: (context, index) =>
                      IndicatorStyle.outlined,
                  itemCount: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
