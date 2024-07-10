import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/screens/home_screen.dart';

class Authenticationservices {
  Future<void> createUserWithEmailAndPassword(
      context, String fullname, emailAddress, location, password) async {
    try {
      _showLoadingDialog(context);
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      add_user_details(fullname, emailAddress, location);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  // signInWithEmailAndPassword
  Future<void> signInWithEmailAndPassword(
      context, String emailAddress, password) async {
    try {
      _showLoadingDialog(context);
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Check if the user is already signed in
  Future<User?> getCurrentUser() async {
    return _auth.currentUser;
  }

  // Add user details to the database
  Future<void> add_user_details(String _fullname, email, location) async {
    FirebaseFirestore.instance
        .collection("UserDetails")
        .doc(_auth.currentUser?.email.toString())
        .set({
      'FullName': _fullname,
      'Email': email,
      'Location': location,
    });
  }

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      // barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(width: 20),
                  Text("Loading..."),
                ],
              )),
        );
      },
    );
  }
}
