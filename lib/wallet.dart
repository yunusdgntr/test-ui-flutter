import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'count_up.dart';

class Wallet extends StatelessWidget {
  Wallet({Key? key}) : super(key: key);
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
  final scroll = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            buildDropDownPortfolio(context),
            buildInfoCard(context),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: _currencies.length,
                  itemBuilder: (context, index) {
                    final item = _currencies[index];
                    return SizedBox(
                      child: buildWalletItem(item, context),
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

  Widget buildWalletItem(String item, BuildContext context) {
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(Icons.badge),
                      Text("Hisse Kod"),
                      Icon(Icons.delete),
                    ],
                  ),
                  Text("Güncel Fiyat"),
                  Text("Günlük Değişim"),
                  Divider(
                    color: Colors.black,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width / 3,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 2000,
                        percent: 0.62,
                        center: Text("90.0%"),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: Colors.orange,
                      ),
                      Text("Tarih")
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

  FormBuilderDropdown<String> buildDropDownPortfolio(BuildContext context) {
    return FormBuilderDropdown(
      name: 'gender',
      decoration: InputDecoration(
        labelText: 'Gender',
      ),
      // initialValue: 'Male',
      allowClear: true,
      hint: Text('Select Gender'),
      validator: FormBuilderValidators.compose(
          [FormBuilderValidators.required(context)]),
      items: _currencies
          .map((gender) => DropdownMenuItem(
                value: gender,
                child: Text('$gender'),
              ))
          .toList(),
    );
  }

  Container buildInfoCard(BuildContext context) {
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Expanded(child: buildWalletStatus(context))],
              ),
            ],
          ),
        ),
      ),
    );
  }

  ClipRRect buildWalletStatus(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      child: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Portföy 1 Kasa Kar/Zarar"),
              Divider(
                color: Colors.black,
              ),
              Countup(
                  begin: 0.1,
                  precision: 2,
                  suffix: " ₺",
                  end: 15064242.5,
                  duration: const Duration(seconds: 1),
                  separator: '',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(0.8),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
