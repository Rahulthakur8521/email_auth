

import 'package:email_auth/home_page.dart';
import 'package:email_auth/main.dart';
import 'package:email_auth/signup_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login(String email, String password) async {
    if (email == "" || password == "") {
      HomePage.CustomAlertBox(context, "EnterRequired Fielde");
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(title: "Login"),
          ),
        );
      } on FirebaseAuthException catch (ex) {
        HomePage.CustomAlertBox(context, ex.code.toString());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor: Colors.purple,
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomePage.CustomTextField(emailController, "Email", Icons.email, false),
          HomePage.CustomTextField(passwordController, "Password", Icons.password, true),
          SizedBox(height: 30,),
          HomePage.CustomButton(() {
            login(emailController.text.toString(), passwordController.text.toString());
          }, 'Login'),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already Have an account??"),
              TextButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage(),));
              }, child: Text("Sign Up",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),)),

            ],
          )
        ],
      ),
    );
  }
}
