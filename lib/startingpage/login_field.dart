import 'package:flutter/material.dart';
import 'package:thriftnstash/screens/main_page.dart';
import 'package:thriftnstash/services/authentication_service.dart';

import 'register_field.dart';

class SignIn extends StatefulWidget {
  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");
  // Validator
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isLoading = false;
  bool passVisible = false;

  // Validator
  void validateInput() {
    FormState? form = this.formKey.currentState;
    SnackBar message = SnackBar(
      content: Text("Processing"),
      duration: Duration(seconds: 2),
    );
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
    // User? user = Provider.of<User?>(context);

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Login Screen"),
      // ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let's sign you in...",
                    style: Theme.of(context).textTheme.headlineSmall!,
                    // style: TextStyle(
                    //     color: Colors.green,
                    //     fontSize: 30,
                    //     fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                height: 50,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                validator: (String? value) {
                  if (value.toString().isEmpty) {
                    return "Field Required";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    label: Text("Email"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25))),
              ),
              Container(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: passVisible,
                keyboardType: TextInputType.visiblePassword,
                validator: (String? value) {
                  if (value.toString().isEmpty) {
                    return "Field Required";
                  }
                  return null;
                },
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
                    label: Text("Password"),
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
                    final message = await AuthService.signIn(
                        email: emailController.text,
                        password: passwordController.text);
                    print(message);

                    if (message == 'Login Success') {
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => MainPage()));
                    }

                    // if (message == 'Success') {
                    //   Navigator.of(context).pushReplacement(
                    //       MaterialPageRoute(builder: (context) => Wrapper()));
                    // }
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(message!),
                      duration: Duration(seconds: 1),
                    ));
                    // AlertDialog(
                    //   content: Text(message!),
                    //   actions: <Widget>[
                    //     TextButton(
                    //         onPressed: () {
                    //           Navigator.pop(context);
                    //         },
                    //         child: Text("Ok"))
                    //   ],
                    // );
                  },
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          "LOGIN",
                          style: TextStyle(fontSize: 15),
                        ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => SignUp())));
                      },
                      child: Text("Register")),
                ],
              )
            ],
          ),
        ),
      ),
      // Column(
      //   children: [
      //     Text("Email"),
      //     Padding(
      //       padding: EdgeInsets.all(20.0),
      // child: TextFormField(
      //   decoration: InputDecoration(
      //       label: Text("Masukkan Email"),
      //       border: OutlineInputBorder(
      //           borderRadius: BorderRadius.circular(10))),
      //       ),
      //     ),
      //     Column(
      //       children: [
      //         Text("Password"),
      //         Padding(
      //           padding: EdgeInsets.all(20.0),
      //           child: TextFormField(
      //             obscureText: true,
      //             decoration: InputDecoration(
      //                 label: Text("Masukkan Password"),
      //                 border: OutlineInputBorder(
      //                     borderRadius: BorderRadius.circular(10))),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
