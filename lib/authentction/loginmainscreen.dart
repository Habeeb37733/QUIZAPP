import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fquizres/components/googlesignin.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../firebase_options.dart';
import 'forgotpass.dart';



class Loginmainscreen extends StatefulWidget {
  final  VoidCallback onClickedSignup2;
  const Loginmainscreen({Key? key, required this.onClickedSignup2}) : super(key: key);

  @override
  State<Loginmainscreen> createState() => _LoginmainscreenState();
}

class _LoginmainscreenState extends State<Loginmainscreen> {

  final usercontrol1 = TextEditingController();
  final password1 = TextEditingController();

  final formkey =GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("F-QUIZ"),),
      body:

    Center(
      child: Form(
        key: formkey,
        child: Card(
          color: Colors.grey.withOpacity(.5),
          child: ListView(
            children: [

              Center(
                child: GradientText(
                  "F-QUIZ",
                  style: TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                  ),
                  colors: [
                    Colors.lightGreen,
                    Colors.red,
                    Colors.yellow,
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 50.0,left: 8,right: 8,bottom: 8),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: TextFormField(
                    controller: usercontrol1,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter your Email',

                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email)=>
                    email!=null && !EmailValidator.validate(email)?
                    'Enter a Valid Email': null,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: TextFormField(
                    controller: password1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                     hintText: 'Enter your Password',
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value)=>
                    value!=null && value.length<6?
                    'Password must be less than 6': null,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 200),
                child: TextButton(
                    onPressed:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>frgtpass())),
                    child: Text(
                      "ForgotPassword?",
                      style: TextStyle(color: Colors.black),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1),
                child: SizedBox(
                  height: 40,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.80,
                  child: ElevatedButton(
                    onPressed:
                    Signin1,

                    child: Text(
                      "SIGN IN",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  ),
                ),
              ),
              SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 200),
            child: RichText(
              text: TextSpan(
                text:"No Account?",
                style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700,color: Colors.black),
                children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap=widget.onClickedSignup2,
                      text: "Sign up",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.red)
                  )
                ],
              ),
            ),
          ),
               SizedBox(
                 height: 25,
               ),
               SizedBox(
                 height: 2,
                 width: MediaQuery.of(context).size.width,
               ),
               ElevatedButton(
                onPressed:
                ()=>signup(context),
                 child: Text(
                  "GOOGLE SIGN IN",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(shape: StadiumBorder()),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }

  Future Signin1() async {
    final isvalid=formkey.currentState!.validate();
    if(!isvalid) return;

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: usercontrol1.text.trim(),
        password: password1.text.trim(),
      );
      setState(() {
        dispose();
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    usercontrol1.clear();
    password1.clear();
  }
}