import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LatoText extends StatelessWidget {
  const LatoText(
      {Key? key,
      required this.text,
      required this.fontsize,
      required this.fontWeight,
      required this.textColor})
      : super(key: key);
  final String text;
  final Color textColor;
  final double fontsize;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          color: textColor, fontSize: fontsize, fontWeight: fontWeight),
    );
  }
}
