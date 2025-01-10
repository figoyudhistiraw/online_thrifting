import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thriftnstash/screens/main_page.dart';

import 'package:thriftnstash/services/authentication_service.dart';
import 'package:thriftnstash/services/utils.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Controller
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController initialPassController = TextEditingController(text: "");
  TextEditingController userFullNameController =
      TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  TextEditingController userPhoneNumberController =
      TextEditingController(text: "");
  bool _isLoading = false;
  // Validator
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  File? image;
  bool passVisible = false;

  var confirmPass;
  // Validator
  void validateInput() {
    FormState? form = this.formKey.currentState;
    SnackBar message = SnackBar(
        duration: Duration(milliseconds: 500), content: Text("Processing"));
    if (form != null) {
      if (form.validate()) {
        ScaffoldMessenger.of(context).showSnackBar(message);
      }
    }
  }

  // Obscure text state
  @override
  void initState() {
    super.initState();
    passVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    print(image);
    // User? user = Provider.of<User?>(context);
    return Scaffold(
        body: Form(
      key: formKey,
      child: Center(
        child: ListView(shrinkWrap: true, children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(children: [
                  image != null
                      ? CircleAvatar(
                          radius: 70,
                          backgroundColor: Colors.grey.shade200,
                          child: CircleAvatar(
                            radius: 65,
                            backgroundImage: FileImage(image!),
                          ),
                        )
                      : CircleAvatar(
                          radius: 65,
                          backgroundImage:
                              AssetImage("images/profile-user.png"),
                          foregroundColor: Colors.white,
                        ),
                  Positioned(
                    bottom: 1,
                    right: 1,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                            onTap: () async {
                              image = await pickImage(ImageSource.gallery);
                              setState(() {
                                image;
                              });
                              print(image);
                            },
                            child: Icon(Icons.edit, color: Colors.black)),
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 3,
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              50,
                            ),
                          ),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(2, 4),
                              color: Colors.black.withOpacity(
                                0.3,
                              ),
                              blurRadius: 3,
                            ),
                          ]),
                    ),
                  ),
                ]),
                Container(
                  height: 35,
                ),
                TextFormField(
                  controller: userFullNameController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      label: Text("Display Name"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
                Container(
                  height: 20,
                ),
                TextFormField(
                  controller: userPhoneNumberController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      label: Text("Phone Number"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
                Container(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value.toString().isEmpty) {
                      return "Field Required";
                    }
                    return null;
                  },
                  controller: emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      label: Text("Email"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
                Container(
                  height: 20,
                ),
                TextFormField(
                  controller: initialPassController,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (String? value) {
                    print(value);

                    if (value.toString().isEmpty) {
                      return "Field Required";
                    }
                    return null;
                  },
                  obscureText: passVisible,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(passVisible
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            passVisible = !passVisible;
                          });
                        },
                      ),
                      prefixIcon: Icon(Icons.lock_person),
                      label: Text("Password"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
                Container(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  validator: (String? value) {
                    print(value);
                    if (value.toString().isEmpty) {
                      return "Field Required";
                    } else if (initialPassController.text !=
                        passwordController.text) {
                      print("Password different");
                      return "Password must be the same as above";
                    }
                    return null;
                  },
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_person),
                      label: Text("Confirm Password"),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25))),
                ),
                Container(
                  height: 30,
                ),
                Container(
                  height: 60,
                  width: 400,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(100)),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25))),
                    onPressed: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      validateInput();
                      final message = await AuthService.signUp(
                          userFullName: userFullNameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          userPhoneNumber: userPhoneNumberController.text,
                          file: image!);
                      print(message);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(message!),
                          duration: Duration(seconds: 1)));
                      if (message == 'Register Success') {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainPage()));
                      } else {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                    child: _isLoading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            "REGISTER",
                            style: TextStyle(fontSize: 15),
                          ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        child: Text("Login Here")),
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
