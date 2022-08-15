import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fquizres/pages/homepage.dart';
import 'package:fquizres/pages/homepage1.dart';

import 'authpage.dart';
import '../pages/dashboard.dart';
import 'loginmainscreen.dart';

class loginscreen extends StatelessWidget {
  const loginscreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder<User?>(

        stream: FirebaseAuth.instance.authStateChanges(),

          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            }
          if(snapshot.hasData){
            print(snapshot.hasData);
            return landingpage();
          }
          return authstate();
        }
      ),

    );
  }
}
