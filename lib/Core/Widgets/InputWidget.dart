import 'package:flutter/material.dart';

import '../Constants/AppColor.dart';
import '../Constants/SpecialText.dart';

class InputWidget extends StatelessWidget {
  final String hintText;
  final double height;
  final String topLabel;
  final bool obscureText;
  final double? labelSize;
  final int? maxLenght;
  final TextEditingController textEditingController;

  InputWidget(
      {required this.hintText,
      this.height = 48.0,
      this.topLabel = "",
      this.obscureText = false,
      this.labelSize = 15,
      this.maxLenght,
      required this.textEditingController});
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          this.topLabel,
          style: SpecialText().getDidact(labelSize, null, Colors.black),
        ),
        SizedBox(height: 5.0),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextFormField(
            controller: textEditingController,
            obscureText: this.obscureText,
            autofocus: true,
            maxLength: maxLenght,
            decoration: InputDecoration(
              // ignore: unnecessary_null_comparison

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color.fromRGBO(74, 77, 84, 0.2),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.primaryYellow,
                ),
              ),
              // hintText: this.hintText,

              hintStyle: TextStyle(
                fontSize: 14.0,
                color: Color.fromRGBO(105, 108, 121, 0.7),
              ),
            ),
          ),
        )
      ],
    );
  }
}
