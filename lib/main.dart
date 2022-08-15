

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'authentction/loginscreen.dart';


import 'authentction/utilsc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // This is the last thing you need to add.
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);


  runApp(MaterialApp(home: loginscreen(),
    //scaffoldMessengerKey:   Utils.showsnackbar(messengerKey),
  debugShowCheckedModeBanner: false,),);
}

