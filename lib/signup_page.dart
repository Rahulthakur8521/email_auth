
import 'package:email_auth/home_page.dart';
import 'package:email_auth/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signUp(String email, String password)async{
    if(email=="" && password==""){
     HomePage.CustomAlertBox(context, "Enter Required Fields");
    }else{
      UserCredential? usercredential;
      try{
        usercredential =await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: "HomePage")));
      }
      on FirebaseAuthException catch(ex){
          return HomePage.CustomAlertBox(context, ex.code.toString());
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: AppBar(
     title: Text('Signup Page'),
     centerTitle: true,
     backgroundColor: Colors.purple,
   ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          HomePage.CustomTextField(nameController, "Name", Icons.person, false),
          HomePage.CustomTextField(emailController, "Email", Icons.email, false),
          HomePage.CustomTextField(passwordController, "Password", Icons.password, true),
          SizedBox(height: 30,),
          HomePage.CustomButton(() {
            signUp(emailController.text.toString(), passwordController.text.toString());

          }, "Sign Up")
        ],
      ),
    );
  }
}
