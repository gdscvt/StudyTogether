import 'dart:developer';
import 'package:google_fonts/google_fonts.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();
  String email = "";
  String password = "";

  // checkFields() {
  //   final form = formKey.currentState;
  //   if (form!.validate()) {
  //     form.save();
  //     return true;
  //   }
  //   return false;
  // }

/**
 * Function to validate email using email_validator
 */
  String? validateEmail(String value) {
    if (EmailValidator.validate(value)) {
      return null;
    }

    return 'Enter valid email';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Form(key: formKey, child: _buildLoginForm())));
  }

  _buildLoginForm() {
    return Padding(
      padding: EdgeInsets.only(left: 25, right: 25, top: 75),
      child: ListView(
        children: [
          SizedBox(height: 75),
          Container(
            height: 125,
            width: 200,
            child: Stack(
              children: [
                Text('Login', style: GoogleFonts.titanOne(fontSize: 72)),
                Positioned(
                    left: 75,
                    top: 90,
                    child: Text('Please sign in to continue',
                        style: GoogleFonts.tomorrow(fontSize: 16))),
                Positioned(
                  left: 210.0,
                  top: 60,
                  child: Container(
                      height: 10.0,
                      width: 10.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFF00AF19))),
                )
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          TextFormField(
            decoration: InputDecoration(
                //filled: true,
                //fillColor: Colors.greenAccent,
                //enabledBorder: UnderlineInputBorder(
                //    borderRadius: BorderRadius.circular(1)),
                labelText: 'Email',
                labelStyle: GoogleFonts.tomorrow(
                    fontSize: 12, color: Colors.black.withOpacity(0.5)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF00AF19)),
                  // borderRadius: BorderRadius.circular(1),
                )),
            onChanged: (value) {
              this.email = value;
            },
            validator: (value) =>
                value!.isEmpty ? 'Email is required' : validateEmail(email),
          ),
          TextFormField(
            decoration: InputDecoration(
                // filled: true,
                // fillColor: Colors.greenAccent,
                // enabledBorder: UnderlineInputBorder(
                //    borderRadius: BorderRadius.circular(10)),
                labelText: 'Password',
                labelStyle: GoogleFonts.tomorrow(
                    fontSize: 12, color: Colors.black.withOpacity(0.5)),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF00AF19)),
                  //  borderRadius: BorderRadius.circular(1),
                )),
            obscureText: true,
            onChanged: (value) {
              this.password = value;
            },
            validator: (value) =>
                value!.isEmpty ? 'Password is required' : null,
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () {
              // to do
            },
            child: Container(
              alignment: Alignment(1, 0),
              padding: EdgeInsets.only(top: 15, left: 20),
              child: InkWell(
                child: Text(
                  'Forgot Password',
                  style: GoogleFonts.tomorrow(
                      fontSize: 11, decoration: TextDecoration.underline),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 50,
              child: Material(
                borderRadius: BorderRadius.circular(25),
                shadowColor: Colors.greenAccent,
                color: Color(0xFF00AF19),
                elevation: 7,
                child: Center(
                  child: Text('Login', style: GoogleFonts.tomorrow()),
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?", style: GoogleFonts.roboto()),
              SizedBox(width: 5),
              InkWell(
                onTap: () {},
                child: Text('Sign up',
                    style: GoogleFonts.roboto(
                        color: Colors.blue,
                        decoration: TextDecoration.underline)),
              )
            ],
          )
        ],
      ),
    );
  }
}
