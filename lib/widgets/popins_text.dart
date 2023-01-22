import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PoppinsText extends StatelessWidget {
  const PoppinsText(
      {Key? key,
      required this.text,
      this.color = Colors.black,
      required this.fontsize,
      required this.fontweight})
      : super(key: key);
  final String text;
  final Color color;
  final double? fontsize;
  final FontWeight fontweight;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
          color: color, fontSize: fontsize, fontWeight: fontweight),
    );
  }
}
