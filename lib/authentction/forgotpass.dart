import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class frgtpass extends StatefulWidget {
  const frgtpass({Key? key}) : super(key: key);

  @override
  State<frgtpass> createState() => _frgtpassState();
}

class _frgtpassState extends State<frgtpass> {
  final usercontrol1 = TextEditingController();
  final formkey =GlobalKey<FormState>();
  void dispose() {
    usercontrol1.dispose();
   
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(.7),
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          TextFormField(
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

            ElevatedButton(
              onPressed:
              forgtpass,

              child: Text(
                "SIGN IN",
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
    );
  }
  Future forgtpass() async {
    final isvalid=formkey.currentState!.validate();
    if(!isvalid) return;
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: usercontrol1.text.trim());
    }on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
  print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
  print('Wrong password provided for that user.');
  }
  }
    AlertDialog(
        title: const Text("Alert Dialog Box"),
    content: const Text("You have raised a Alert Dialog Box"),);
 Navigator.of(context).pop();

}

}
