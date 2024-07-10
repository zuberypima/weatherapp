import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/screens/authScreen/login_page.dart';
import 'package:weather_app_tutorial/services/authenticationServices.dart';
import 'package:weather_app_tutorial/widgets/customeTextFormField.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _fullname = TextEditingController();
  TextEditingController _emailContoler = TextEditingController();
  TextEditingController _location = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            const Center(
              child: Text(
                "Register your account",
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
              "Full Name",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            custom_text_form(false, _fullname, 'Jane Doe'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Email Address",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            custom_text_form(false, _emailContoler, 'user@gmail.com'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Regional",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            custom_text_form(false, _location, 'Morogoro'),
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
                    Authenticationservices().createUserWithEmailAndPassword(
                        context,
                        _fullname.text,
                        _emailContoler.text,
                        _location.text,
                        _password.text);
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            link_container(context)
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
        Text("I have an account"),
        SizedBox(
          width: 5,
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Text("Login"))
      ],
    ),
  );
}
