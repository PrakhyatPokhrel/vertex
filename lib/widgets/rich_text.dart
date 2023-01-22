import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText(
      {super.key,
      required this.ontap,
      required this.text,
      required this.richtext,
      this.style = const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontFamily: "Lato"),
      required this.richtextColor});
  final Function() ontap;
  final String text;
  final String richtext;
  final Color richtextColor;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: ontap,
        child: Text.rich(TextSpan(
            style: GoogleFonts.lato(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
            text: text,
            children: [
              TextSpan(text: richtext, style: TextStyle(color: richtextColor))
            ])));
  }
}
