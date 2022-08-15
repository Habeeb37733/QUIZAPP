import 'package:flutter/cupertino.dart';
import 'package:fquizres/authentction/loginmainscreen.dart';
import 'package:fquizres/authentction/signnup.dart';

class authstate extends StatefulWidget {
  const authstate({Key? key}) : super(key: key);

  @override
  State<authstate> createState() => _authstateState();
}

class _authstateState extends State<authstate> {
  bool isloggin=true;
  @override
  Widget build(BuildContext context) =>
     isloggin ?
     Loginmainscreen(onClickedSignup2:toggle) :
     Signuppage(onClickedSignup1:toggle);

  void toggle()=>setState(()
   => isloggin =  !isloggin);



}
