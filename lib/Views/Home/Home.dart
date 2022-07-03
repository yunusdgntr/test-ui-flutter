import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lottie/lottie.dart';
import 'package:testui/Core/Constants/SpecialText.dart';
import 'package:testui/Service/TickerService.dart';

import '../../Core/Widgets/InputWidget.dart';
import '../../Models/ticker.dart';
import '../../count_up.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currencies = ["BIST", "Emtia", "Döviz", "Kripto", "Fon"];

  late TextEditingController searchController;
  List<Ticker>? tickers;
  bool isLoaded = false;
  Future<void> loadTickers() async {
    var tickerService = TickerService();
    tickers = await tickerService.GetTickerList();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();

    searchController = TextEditingController();
    loadTickers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: InputWidget(
                    hintText: 'Ara', textEditingController: searchController),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(child: buildDropDownPortfolio(context, _currencies))
            ],
          ),
          SizedBox(
            height: 15,
          ),
          isLoaded
              ? Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: tickers!.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.only(
                              left: 4,
                              top: 6,
                              right: 4,
                              bottom: 3,
                            ),
                            width: double.infinity,
                            decoration: buildColoredBoxDecoration(
                                Theme.of(context).cardColor),
                            child: Container(
                              height: 70,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            buildChangeIcon(
                                                tickers![index].change),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              tickers![index]
                                                  .tickerName
                                                  .toString(),
                                              style: SpecialText().getRoboto(
                                                  20, FontWeight.bold, null),
                                            ),
                                            Text(tickers![index]
                                                .tickerCode
                                                .toString()),
                                          ],
                                        )
                                      ],
                                    ),
                                    flex: 3,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5.0, bottom: 5),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Countup(
                                                begin: 0.1,
                                                precision: 2,
                                                end: tickers![index].price!,
                                                duration:
                                                    const Duration(seconds: 1),
                                                separator: '',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey
                                                      .withOpacity(0.8),
                                                )),
                                          ),
                                          Container(
                                            alignment: Alignment.center,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                            decoration:
                                                buildColoredBoxDecoration(
                                                    buildChangeColor(
                                                        tickers![index]
                                                            .change)),
                                            padding: const EdgeInsets.all(5),
                                            child: Countup(
                                                begin: 0.1,
                                                prefix: "%",
                                                precision: 2,
                                                end: tickers![index].change!,
                                                duration:
                                                    const Duration(seconds: 1),
                                                separator: '',
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.white,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                    flex: 2,
                                  ),
                                  Expanded(
                                    child: PopupMenuButton(
                                        onSelected: (dynamic data) {
                                          if (data == 1) {
                                            // value.goToAdd(value.list[index]);
                                          } else if (data == 2) {
                                          } else if (data == 3) {
                                            // value.addFav(value.list[index]);
                                          }
                                        },
                                        itemBuilder: (context) => [
                                              PopupMenuItem(
                                                  value: 1,
                                                  child: Row(
                                                    children: <Widget>[
                                                      const Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                2, 2, 2, 2),
                                                        child:
                                                            Icon(Icons.delete),
                                                      ),
                                                      const Text("Delete")
                                                    ],
                                                  )),
                                              PopupMenuItem(
                                                  value: 2,
                                                  child: Row(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                2, 2, 8, 2),
                                                        child:
                                                            Icon(Icons.search),
                                                      ),
                                                      Text("Detay")
                                                    ],
                                                  )),
                                              PopupMenuItem(
                                                  value: 3,
                                                  child: Row(
                                                    children: <Widget>[
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                2, 2, 8, 2),
                                                        child: Icon(Icons
                                                            .add_to_queue_outlined),
                                                      ),
                                                      Text("Ekle")
                                                    ],
                                                  )),
                                            ]),
                                    flex: 1,
                                  )
                                ],
                              ),
                            ));
                      },
                    ),
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ],
      ),
    );
  }

  Widget buildDropDownPortfolio(BuildContext context, List<String> currencies) {
    return Container(
      width: 200,
      child: FormBuilderDropdown(
        name: 'gender',
        decoration: InputDecoration(
          labelText: 'Yatırım Ortamı',
        ),
        // initialValue: 'Male',
        allowClear: true,
        hint: Text('Tür Seçiniz'),
        validator: FormBuilderValidators.compose(
            [FormBuilderValidators.required(context)]),
        items: currencies
            .map((gender) => DropdownMenuItem(
                  value: gender,
                  child: Text('$gender'),
                ))
            .toList(),
      ),
    );
  }
}

BoxDecoration buildColoredBoxDecoration(Color color) {
  return BoxDecoration(
    color: color,
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(7),
        topRight: Radius.circular(7),
        bottomLeft: Radius.circular(7),
        bottomRight: Radius.circular(7)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.5),
        spreadRadius: 3,
        blurRadius: 4,
        offset: const Offset(0, 3),
      ),
    ],
  );
}

Widget buildChangeIcon(double? change) {
  if (change! > 0) {
    return Expanded(child: Lottie.asset('assets/animations/upup.json'));
  }
  if (change < 0) {
    return const Icon(
      Icons.arrow_downward,
      color: Colors.red,
      size: 35.0,
    );
  }
  return const Icon(
    Icons.maximize,
    color: Colors.grey,
    size: 35.0,
  );
}

Color buildChangeColor(double? change) {
  if (change! > 0) {
    return Colors.green;
  }
  if (change < 0) {
    return Colors.red;
  }
  return Colors.grey;
}
