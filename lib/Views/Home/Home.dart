import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../Core/Widgets/InputWidget.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _currencies = ["BIST", "Emtia", "Döviz", "Kripto", "Fon"];

  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();

    searchController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: Text(""),
                ),
              ],
            ),
          ),
          InputWidget(
              topLabel: 'Ara',
              hintText: 'Ara',
              textEditingController: searchController),
          buildDropDownPortfolio(context, _currencies)
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
