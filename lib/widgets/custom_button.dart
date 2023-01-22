import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      required this.buttonColor,
      required this.textstyle})
      : super(key: key);
  final Color buttonColor;
  final String buttonText;
  final TextStyle textstyle;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20),
            backgroundColor: buttonColor,
            fixedSize: Size(MediaQuery.of(context).size.width, 57),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: textstyle,
        ),
      ),
    );
  }
}
