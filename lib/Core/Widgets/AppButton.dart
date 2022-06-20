import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/AppColor.dart';

enum ButtonType { PRIMARY, PLAIN }

class AppButton extends StatelessWidget {
  final ButtonType type;
  final VoidCallback onPressed;
  final String text;
  final double height;
  final Color buttonTextColor;

  AppButton(
      {required this.height,
      required this.type,
      required this.onPressed,
      required this.text,
      required this.buttonTextColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: this.type == ButtonType.PRIMARY
              ? AppColors.primaryYellow
              : AppColors.primaryYellow,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(169, 176, 185, 0.42),
              spreadRadius: 0,
              blurRadius: 8.0,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Center(
          child: Text(
            this.text,
            style: GoogleFonts.teko(
              color: buttonTextColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
