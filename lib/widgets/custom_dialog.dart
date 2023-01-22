import 'package:flutter/material.dart';

Future<dynamic> showCustomDialog(
    BuildContext context, String title, String content, bool success) {
  return showDialog(
      context: context,
      builder: ((context) => AlertDialog(
          title: Text(title),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok"))
          ],
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              success
                  ? Image.asset("assets/images/success.gif")
                  : Image.asset("assets/images/error.gif"),
              Text(content),
            ],
          ))));
}
