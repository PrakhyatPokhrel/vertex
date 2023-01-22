import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:igniters/constants/MyColors.dart';
import 'package:igniters/constants/url_conatants.dart';
import 'package:igniters/screens/register/register_screen.dart';
import 'package:igniters/utils/services/rest_api_service.dart';
import 'package:igniters/widgets/custom_button.dart';
import 'package:igniters/widgets/custom_formfield.dart';
import 'package:igniters/widgets/lato_text.dart';
import 'package:igniters/widgets/popins_text.dart';
import 'package:igniters/widgets/rich_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatelessWidget {
  const LoginForm(
      {Key? key,
      required this.emailcontroller,
      required this.passwordcontroller})
      : super(key: key);

  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();

    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LatoText(
              text: "Mobile Number",
              fontWeight: FontWeight.w500,
              fontsize: 20,
              textColor: Colors.black),
          CustomFormfield(
            validator: (value) {
              RegExp exp = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
              if (value == null || value.isEmpty) {
                return "Please enter email";
              } else if (int.tryParse(emailcontroller.text) != null &&
                  (int.tryParse(emailcontroller.text).toString().length ==
                      10)) {
              } else if (!exp.hasMatch(value)) {
                print((int.tryParse(emailcontroller.text)).toString());
                return "Please enter valid email";
              }
              return null;
            },
            controller: emailcontroller,
            hintText: "Enter Your Number",
          ),
          const SizedBox(
            height: 15,
          ),
          const LatoText(
              text: "Password",
              fontWeight: FontWeight.w500,
              fontsize: 20,
              textColor: Colors.black),
          CustomFormfield(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter password";
              }
              return null;
            },
            obscure: true,
            controller: passwordcontroller,
            hintText: "Enter Your Password",
          ),
          const SizedBox(
            height: 9,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
            PoppinsText(
                text: "Forget Password",
                fontsize: 15,
                fontweight: FontWeight.w400),
          ]),
          const SizedBox(
            height: 15,
          ),
          CustomButton(
              buttonText: "LOGIN",
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  StreamedResponse data = await RestAPIService()
                      .post(APIUrl.signIn, <String, String>{
                    "phone": emailcontroller.text,
                    "email": emailcontroller.text,
                    "password": passwordcontroller.text
                  });
                  var res = await data.stream.bytesToString();
                  var response = jsonDecode(res);
                  print(data);
                  final prefs = await SharedPreferences.getInstance();
                  if (data.statusCode == 200) {
                    print(response[0]["userid"].toString());
                    prefs.setString("id", response[0]["userid"]);
                    print("entered");
                    // ignore: use_build_context_synchronously
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: ((context) => const HomeScreen())));
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: const Text("Email or password is incorrect"),
                        title: const Text("Error"),
                        actions: [
                          TextButton(
                              onPressed: () => (Navigator.pop(context)),
                              child: const Text("OK"))
                        ],
                      ),
                    );
                  }
                }
                // ignore: use_build_context_synchronously
              },
              buttonColor: MyColors.primary,
              textstyle: GoogleFonts.lato(
                  fontWeight: FontWeight.w700, letterSpacing: 1.59)),
          const SizedBox(height: 23),
          CustomRichText(
            text: "Not Registered Yet? ",
            ontap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: ((context) => const RegisterScreen()))),
            richtext: "Register Now",
            richtextColor: Colors.green,
          )
        ],
      ),
    );
  }
}
