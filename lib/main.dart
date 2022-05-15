import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';
import 'package:testui/fav.dart';
import 'package:testui/wallet.dart';
import 'stateful_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColorDark: Colors.white,
      ),
      home: const BuySellPage(title: 'Flutter Demo Home Page', code: 'asels'),
    );
  }
}

class BuySellPage extends StatefulWidget {
  const BuySellPage({Key? key, required this.title, required this.code})
      : super(key: key);

  final String title;
  final String code;

  @override
  State<BuySellPage> createState() => _BuySellPageState();
}

class _BuySellPageState extends State<BuySellPage> {
  int _counter = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TextEditingController priceController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController countController = TextEditingController();
  TextEditingController feeController = TextEditingController();
  TextEditingController portfolioController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _textEditingController = TextEditingController();

  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          bool isChecked = false;
          _textEditingController.clear();
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _textEditingController,
                        validator: (value) {
                          return value!.isNotEmpty ? null : "Enter any text";
                        },
                        decoration:
                            InputDecoration(hintText: "Please Enter Text"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Choice Box"),
                          Checkbox(
                              value: isChecked,
                              onChanged: (checked) {
                                setState(() {
                                  isChecked = checked!;
                                });
                              })
                        ],
                      )
                    ],
                  )),
              title: Text('Stateful Dialog'),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('OK'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Do something like updating SharedPreferences or User Settings etc.
                      Navigator.of(context).pop();
                    }
                  },
                ),
                ElevatedButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
        });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _showToast(String text, String date) {
    log(date);
    save();
  }

  void save() {
    var price = double.tryParse(priceController.text);
    var count = double.tryParse(countController.text);
    var fee = double.tryParse(feeController.text);
    if (price == null || count == null) {
      showSnackMessage("Test");
      return;
    }
    var cost = price * count;
    if (fee != null) cost = cost + fee;
    if (fee != null) log("Malliyet:" + cost.toString());
  }

  void showSnackMessage(String message) {
    var snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                buildTextFormField(priceController, 'Price'),
                buildTextFormField(countController, 'Count'),
                buildTextFormField(feeController, 'Fee'),
                buildFormBuilderDateTimePicker(),
                buildButtonRow(),
                buildInfoCard()
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showInformationDialog(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Container buildInfoCard() {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Nakit:"),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Komisyon Tutar:"),
                  const Text("Toplam Tutar:"),
                  const Text("Mevcut Adet:"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 10,
          child: ElevatedButton(
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Portfolio()),
              );
            },
            child: const Text('Buy'),
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 10,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => TrackList()),
              );
            },
            child: const Text('Sell'),
          ),
        ),
        Expanded(
          flex: 10,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Wallet()),
              );
            },
            child: const Text('3'),
          ),
        ),
      ],
    );
  }

  FormBuilderDateTimePicker buildFormBuilderDateTimePicker() {
    return FormBuilderDateTimePicker(
      controller: dateController,
      name: 'date',
      format: DateFormat('dd/MM/yyyy'),
      // onChanged: _onChanged,
      inputType: InputType.date,
      decoration: const InputDecoration(
        icon: Icon(Icons.date_range),
        hintText: 'Price Ticker?',
        labelText: 'Price *',
      ),
      initialValue: DateTime.now(),
      enabled: true,
    );
  }

  TextFormField buildTextFormField(
      TextEditingController controller, String? hint) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      decoration: InputDecoration(
        icon: const Icon(Icons.account_balance_wallet_sharp),
        hintText: hint,
        labelText: hint,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r"[0-9.]")),
        TextInputFormatter.withFunction((oldValue, newValue) {
          try {
            final text = newValue.text;
            if (text.isNotEmpty) double.parse(text);
            return newValue;
          } catch (e) {}
          return oldValue;
        }),
      ],
      validator: (value) => value!.isNotEmpty ? null : 'Required field',
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
    );
  }
}
