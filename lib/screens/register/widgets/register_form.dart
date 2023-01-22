import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:igniters/constants/MyColors.dart';
import 'package:igniters/constants/url_conatants.dart';
import 'package:igniters/screens/login/loginscreen.dart';
import 'package:igniters/utils/services/rest_api_service.dart';
import 'package:igniters/widgets/custom_button.dart';
import 'package:igniters/widgets/custom_formfield.dart';
import 'package:igniters/widgets/districtformfield/districtmodel.dart';
import 'package:igniters/widgets/rich_text.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.nameController,
      required this.phoneController,
      required this.confirmPasswordController,
      required this.addressController})
      : super(key: key);
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController confirmPasswordController;
  final TextEditingController addressController;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    String? district = "Kathmandu";
    String? municipality = "Budhanilkantha Municipality";
    List<String> list1 = [
      "Budhanilkantha Municipality",
      "Chandragiri Municipality",
      "Dakshinkali Municipality",
      "Gokarneshwor Municipality",
      "Kageshwori-Manohara Municipality",
      "Kathmandu Metropolitan City",
      "Kirtipur Municipality",
      "Nagarjun Municipality",
      "Shankhapur Municipality",
      "Tarakeshwor Municipality",
      "Tokha Municipality"
    ];
    tryloop(value) {
      for (int i = 0; i < allDistricts.length; i++) {
        if (value == allDistricts[i]) {
          setState(() {
            list1 = municipalityy[i];
          });
        }
      }
    }

    return Form(
      key: formkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRichText(
              ontap: () {},
              text: "Fullname",
              richtext: "*",
              richtextColor: Colors.red),
          CustomFormfield(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "FullName is required";
              }
              return null;
            },
            controller: widget.nameController,
            hintText: "Please Enter FullName",
          ),
          const SizedBox(
            height: 15,
          ),
          CustomRichText(
              ontap: () {},
              text: "Email",
              richtext: "*",
              richtextColor: Colors.red),
          const SizedBox(
            height: 15,
          ),
          CustomRichText(
              ontap: () {},
              text: "Phonenumber",
              richtext: "*",
              richtextColor: Colors.red),
          CustomFormfield(
            textformatter: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10)
            ],
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Phonenumber is required";
              }
              return null;
            },
            controller: widget.phoneController,
            hintText: "Please Enter phonenumber",
          ),
          const SizedBox(
            height: 15,
          ),
          CustomRichText(
              ontap: () {},
              text: "Password",
              richtext: "*",
              richtextColor: Colors.red),
          CustomFormfield(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Password is required";
              } else if (value.length < 6) {
                return "Password length must be atleast 6";
              }
              return null;
            },
            obscure: true,
            controller: widget.passwordController,
            hintText: "Please Enter Password",
          ),
          const SizedBox(
            height: 15,
          ),
          CustomRichText(
              ontap: () {},
              text: "Confirm Password",
              richtext: "*",
              richtextColor: Colors.red),
          CustomFormfield(
            obscure: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Confirm Password is required";
              } else if (value != widget.passwordController.text) {
                return "Password and Confirm Password didn't match";
              }
              return null;
            },
            controller: widget.confirmPasswordController,
            hintText: "Please Enter FullName",
          ),
          const SizedBox(
            height: 15,
          ),
          CustomRichText(
              ontap: () {},
              text: "Address",
              richtext: "*",
              richtextColor: Colors.red),
          DropdownSearch<String>(
            items: allDistricts,
            popupProps: const PopupPropsMultiSelection.menu(
              showSelectedItems: true,
              showSearchBox: true,
            ),
            onChanged: ((value) {
              setState(() {
                district = value;
              });
              tryloop(value);
            }),
            selectedItem: "Kathmandu",
          ),
          const SizedBox(
            height: 15,
          ),
          CustomButton(
              buttonText: "REGISTER",
              onPressed: () async {
                if (formkey.currentState!.validate()) {
                  StreamedResponse check =
                      await RestAPIService().post(APIUrl.register, {
                    "phone": widget.phoneController.text,
                    "email": widget.emailController.text,
                    "password": widget.passwordController.text,
                    "fullname": widget.nameController.text,
                    "address": widget.addressController.text
                  });
                  if (check.statusCode == 200) {
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const LoginScreen())));
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Registered Successfully."),
                        content: const Text("User Created Successfully"),
                        actions: [
                          TextButton(
                              onPressed: () => (Navigator.pop(context)),
                              child: const Text("OK"))
                        ],
                      ),
                    );
                  } else {
                    showDialog(
                        context: context,
                        builder: ((context) => AlertDialog(
                              title: const Text("Error"),
                              content:
                                  const Text("Email or phone already exist"),
                              actions: [
                                TextButton(
                                    onPressed: (() => Navigator.pop(context)),
                                    child: const Text("Ok"))
                              ],
                            )));
                  }
                }
              },
              buttonColor: MyColors.primary,
              textstyle: GoogleFonts.lato(
                  fontWeight: FontWeight.w700, letterSpacing: 1.59)),
          const SizedBox(height: 23),
        ],
      ),
    );
  }
}
