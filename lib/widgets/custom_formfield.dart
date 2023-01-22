import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:igniters/constants/MyColors.dart';

class CustomFormfield extends StatefulWidget {
  const CustomFormfield(
      {Key? key,
      required this.controller,
      this.labelText,
      this.onPressed,
      this.validator,
      this.hintText,
      this.contentPadding = 16,
      this.maxlines,
      this.textformatter,
      this.obscure = false})
      : super(key: key);
  final int? maxlines;
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onPressed;
  final double? contentPadding;
  final List<TextInputFormatter>? textformatter;
  final bool obscure;
  @override
  State<CustomFormfield> createState() => _CustomFormfieldState();
}

class _CustomFormfieldState extends State<CustomFormfield> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      // child: SizedBox(
      //   height: 57.h,
      child: TextFormField(
          obscureText: widget.obscure ? obscure : false,
          controller: widget.controller,
          // maxLines: maxlines,
          decoration: InputDecoration(
            suffixIcon: widget.obscure
                ? GestureDetector(
                    child: Icon(
                      obscure ? Icons.visibility_off : Icons.visibility,
                      color: MyColors.primary,
                    ),
                    onTap: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    })
                : null,
            // filled: true,
            // fillColor: MyColors.formFieldBackgroundColor,
            contentPadding: EdgeInsets.symmetric(
                vertical: 10, horizontal: widget.contentPadding!),
            labelText: widget.labelText,
            hintText: widget.hintText,
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: MyColors.primary)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: MyColors.primary)),
            // floatingLabelStyle: TextStyle(color: MyColors.primary),
          ),
          style: const TextStyle(color: Colors.black, fontSize: 16),
          cursorColor: Colors.black,
          inputFormatters: widget.textformatter,
          validator: widget.validator),
      // ),
    );
  }
}
