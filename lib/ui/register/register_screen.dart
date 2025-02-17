import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:troma_demo/model/user_model.dart';
import 'package:troma_demo/provider/usermanagement_provider.dart';
import 'package:troma_demo/utils/validator.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  bool isPasswordHide = true;

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
                          "Sign up for Amazing app",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
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
                          style: TextStyle(color: Colors.white),
                          maxLength: 10,
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            counterText: "",
                            prefixIcon: Icon(Icons.phone),
                            prefixIconColor: Colors.white,
                            hintText: "Phone",
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
                            } else if (!value.isValidatePhone()) {
                              return "Please enter valid phone number";
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
                        SizedBox(height: 50),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 20),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.orange)),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  UserModel model = UserModel();
                                  model.email =
                                      _emailController.text.toString();
                                  model.password =
                                      _passwordController.text.toString();
                                  model.name = "PKKK";
                                  model.avatar = "https://picsum.photos/800";

                                  callAddUser(model);

                                  Fluttertoast.showToast(
                                      msg: "Register Success",
                                      backgroundColor: Colors.green);
                                }
                              },
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width - 25,
                                  child: Center(
                                      child: Text("Register",
                                          style: TextStyle(
                                              color: Colors.white))))),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Already have an account?",
                                style: TextStyle(color: Colors.white)),
                            TextSpan(
                                text: "Sign in",
                                style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline)),
                          ])),
                        )
                      ],
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  void callAddUser(UserModel model) {
    context.read<UserManagementProvider>().addUser(model);
  }
}
