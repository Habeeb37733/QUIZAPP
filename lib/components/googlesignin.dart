
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../firebase_options.dart';
import '../pages/homepage.dart';


// function to implement the google signin

// creating firebase instance
final FirebaseAuth auth = FirebaseAuth.instance;

Future<void> signup(BuildContext context) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,);
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final GoogleSignInAccount? googleuser = await googleSignIn.signIn();
  if (googleuser != null) {
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleuser.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    // Getting users credential
    UserCredential result = await auth.signInWithCredential(authCredential);
    User? user = result.user;

    if (result != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => homepag()));
    } // if result not null we simply call the MaterialpageRoute,
    // for go to the HomePage screen
  }
}




