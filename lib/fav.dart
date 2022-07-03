import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:intl/intl.dart';

class TrackList extends StatelessWidget {
  TrackList({Key? key}) : super(key: key);
  var _currencies = [
    "Food",
    "Transport",
    "Personal",
    "Shopping",
    "Medical",
    "Rent",
    "Movie2",
    "Medical2",
    "Rent2",
    "Salary2"
  ];
  final fontSmall = TextStyle(fontSize: 12);
  final fontMiddle = TextStyle(fontSize: 15);
  final fontBig = TextStyle(fontSize: 20);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: _currencies.length,
                  itemBuilder: (context, index) {
                    final item = _currencies[index];
                    return SizedBox(
                      child: buildFavItem(item, context),
                    );
                  },
                ),
              ),
            ),
          ],
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
                              style: fontSmall,
                            ),
                            Text(
                              "Takip Yaş",
                              style: fontSmall,
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
                                  style: fontSmall,
                                ),
                                Icon(
                                  Icons.arrow_downward,
                                  color: Colors.red,
                                ),
                              ],
                            ),
                            Text(
                              "Takip Fiyat",
                              style: fontSmall,
                            ),
                          ],
                        ),
                        flex: 3,
                      ),
                      Expanded(
                        child: buildPopUpMenu(),
                        flex: 1,
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Tarih:" +
                            DateFormat('MM dd yyyy').format(DateTime.now()),
                        style: fontSmall,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PopupMenuButton<int> buildPopUpMenu() {
    return PopupMenuButton(
        icon: Icon(Icons.list_sharp),
        onSelected: (dynamic data) {
          if (data == 1) {
          } else if (data == 2) {
          } else if (data == 3) {}
        },
        itemBuilder: (context) => [
              PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: <Widget>[
                      const Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 2, 2),
                        child: Icon(Icons.delete),
                      ),
                      const Text("Delete")
                    ],
                  )),
              PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Icon(Icons.search),
                      ),
                      Text("Detay")
                    ],
                  )),
              PopupMenuItem(
                  value: 3,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                        child: Icon(Icons.add_to_queue_outlined),
                      ),
                      Text("Ekle")
                    ],
                  )),
            ]);
  }
}
