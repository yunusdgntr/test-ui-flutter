import 'package:flutter/material.dart';

import '../Constants/AppColor.dart';
import '../Constants/SpecialText.dart';

class InputPassWidget extends StatefulWidget {
  final String hintText;
  final double height;
  final String topLabel;

  final double? labelSize;
  final int? maxLenght;
  final TextEditingController textEditingController;

  InputPassWidget(
      {required this.hintText,
      this.height = 48.0,
      this.topLabel = "",
      this.labelSize = 15,
      this.maxLenght,
      required this.textEditingController});

  @override
  State<InputPassWidget> createState() => _InputPassWidgetState();
}

class _InputPassWidgetState extends State<InputPassWidget> {
  bool passWordVisible = true;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.topLabel,
          style: SpecialText().getDidact(widget.labelSize, null, Colors.black),
        ),
        SizedBox(height: 5.0),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextFormField(
            controller: widget.textEditingController,
            obscureText: passWordVisible,
            maxLength: widget.maxLenght,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    passWordVisible = !passWordVisible;
                  });
                },
                icon: passWordVisible
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
              ),
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
