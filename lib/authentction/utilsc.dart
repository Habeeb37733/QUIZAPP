import 'package:flutter/material.dart';
final messengerKey=GlobalKey<ScaffoldMessengerState>();
class Utils{
  static showsnackbar(String? text){
    if(text==null) return;
    final snackbar=SnackBar(content: Text(text),backgroundColor: Colors.black,);
    messengerKey.currentState!
    ..removeCurrentSnackBar()
    ..showSnackBar(snackbar);
  }
}