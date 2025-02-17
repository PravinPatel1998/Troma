import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:troma_demo/AppContant/app_images.dart';
import 'package:troma_demo/ui/register/register_screen.dart';
import 'package:troma_demo/utils/validator.dart';

import '../../utils/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isPasswordHide = true;

  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Login")),
      body: Stack(
        children: [
          Positioned.fill(
              child: Lottie.asset("assets/lottie/anim_bg_login.json",
                  fit: BoxFit.cover)),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        Text(
                          "Sign in",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.normal),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => RegisterScreen()));
                          },
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Don't have account? ",
                                style: TextStyle(color: Colors.white)),
                            TextSpan(
                                text: "Sign up",
                                style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline)),
                          ])),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: _emailController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            prefixIconColor: Colors.white,
                            suffixIcon: _emailController.text.isNotEmpty
                                ? InkWell(
                                    onTap: () {
                                      _emailController.clear();
                                      setState(() {});
                                    },
                                    child: Icon(Icons.close_rounded))
                                : SizedBox(),
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.white70),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                          ),
                          validator: (value) {
                            if (!value!.isValidateEmpty()) {
                              return "Email can't be empty";
                            } else if (!value.isValidEmail()) {
                              return "Please enter valid email";
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20),
                        TextFormField(
                          obscureText: isPasswordHide,
                          style: TextStyle(color: Colors.white),
                          controller: _passwordController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            prefixIconColor: Colors.white,
                            suffixIconColor: Colors.white,
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isPasswordHide = !isPasswordHide;
                                });
                              },
                              child: Icon(isPasswordHide == true
                                  ? CupertinoIcons.eye_slash
                                  : CupertinoIcons.eye),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.white70),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                          ),
                          validator: (password) {
                            if (!password!.isValidateEmpty()) {
                              return "Please enter password";
                            } else if (!password.isValidatePassword()) {
                              return "Password must be more than 6 digit";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: InkWell(
                                  onFocusChange: (hover) => false,
                                  onTap: () {},
                                  child: Text(
                                    "Forgot Password",
                                    style: TextStyle(
                                        color: Colors.white,
                                        decoration: TextDecoration.underline,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        decorationColor: Colors.white),
                                  )),
                            )),
                        SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 20),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.orange)),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  Fluttertoast.showToast(
                                      msg: "Login Success",
                                      backgroundColor: Colors.green);
                                }

                                //await _googleSignIn();
                              },
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width - 25,
                                  child: Center(
                                      child: Text("Login",
                                          style: TextStyle(
                                              color: Colors.white))))),
                        ),
                        IconButton(
                            color: Colors.yellow,
                            focusColor: Colors.yellow,
                            onPressed: () {
                              _googleSignIn();
                            },
                            icon: SvgPicture.asset(
                              AppIcon.icDuck,
                              height: 50,
                              width: 50,
                            )),
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  _googleSignIn() async {
    User? user = await authService.signInWithGoogle();
    if (user != null) {
      log("User : email : ${user.email}");
      log("User : name : ${user.displayName}");
      log("User : phone : ${user.phoneNumber}");
      log("User : photo : ${user.photoURL}");

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("${user.displayName} Login Successful")));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Login Failed")));
    }
  }
}
