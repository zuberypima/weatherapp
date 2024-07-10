import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/screens/authScreen/registration_page.dart';
import 'package:weather_app_tutorial/services/authenticationServices.dart';
import 'package:weather_app_tutorial/widgets/customeTextFormField.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController _emailContoler = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            const Center(
              child: Text(
                "Login into your account",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Email Address",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            custom_text_form(false, _emailContoler, 'usere@gmail.com'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Password",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            custom_text_form(true, _password, '******'),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(
                          AppColors.secondaryBlack)),
                  onPressed: () {
                    Authenticationservices().signInWithEmailAndPassword(
                        context, _emailContoler.text, _password.text);
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            Center(child: link_container(context))
          ],
        ),
      ),
    );
  }
}

Widget link_container(context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Row(
      // crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("I don't have an account"),
        SizedBox(
          width: 5,
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => RegistrationPage()));
            },
            child: Text("Register"))
      ],
    ),
  );
}
