import 'package:flutter/material.dart';
import 'package:igniters/constants/MyColors.dart';
import 'package:igniters/screens/login/widgets/login_form.dart';
import 'package:igniters/widgets/lato_text.dart';
import 'package:igniters/widgets/popins_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 97,
              ),
              LatoText(
                textColor: Color.fromARGB(255, 99, 98, 98),
                text: "Login",
                fontsize: 36,
                fontWeight: FontWeight.w700,
              ),
              const SizedBox(
                height: 17,
              ),
              const PoppinsText(
                text: "Please Sign In to continue",
                fontsize: 22,
                fontweight: FontWeight.w400,
              ),
              const SizedBox(
                height: 40,
              ),
              // Center(child: Image.asset("assets/images/logo.png")),
              const SizedBox(
                height: 40,
              ),
              LoginForm(
                passwordcontroller: passwordcontroller,
                emailcontroller: emailcontroller,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
