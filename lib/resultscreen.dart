import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fquizres/pages/dashboard.dart';
import 'package:fquizres/pages/homepage.dart';

class resultscreen extends StatelessWidget {
  final int score;
  Color maincolor = Color(0xFF252c4a);
  Color secondcolor = Color(0xFF117eeb);
resultscreen({required this.score});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            Text("CONGRATS", style: TextStyle(
              color: Colors.amber, fontSize: 40, fontWeight: FontWeight.w700,
            ),),
            Text("Your Score:", style: TextStyle(
              color: Colors.red, fontSize: 30, fontWeight: FontWeight.w700,
            ),),
            Text("${score}", style: const TextStyle(
              color: Colors.orange, fontSize: 40, fontWeight: FontWeight.w700,
            ),),
            SizedBox(height: 40,),
            ElevatedButton(onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> landingpage())),
                
                child: Text("Back to home",style: TextStyle(fontSize: 20),)),

          ],
        ),
      ),

    );
  }

}
