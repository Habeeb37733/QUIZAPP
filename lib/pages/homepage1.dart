import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data/question_list.dart';
import '../resultscreen.dart';

class homepag1 extends StatefulWidget {
  int score=0;



  @override
  State<homepag1> createState() => _homepag1State();
}

class _homepag1State extends State<homepag1> {
  Color maincolor =Color(0xFF252c4a);
  Color secondcolor=Color(0xFF117eeb);
  PageController? _controller=PageController(initialPage:0);
  bool ispressed=false;
  Color trueanser=Colors.green;
  Color isWrong=Colors.red;
  int score=0;
  Color btnColor=Color(0xFF117eeb);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: Padding(padding: EdgeInsets.all(18),
        child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (page){
              setState(() {
                ispressed=false;
              });
            },
            controller: _controller,
            itemCount: questions1.length,
            itemBuilder:(context, index){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Question ${index + 1}/${questions.length}",
                      style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.w500,fontSize: 35,
                      ),),
                  ),
                  Divider(
                    color: Colors.white,
                    height: 8.0,
                    thickness: 2.0,
                  ),
                  Text(questions1[index].question!,
                    style: TextStyle(
                      color: Colors.white,fontSize: 28.0,
                    ),),
                  SizedBox(height: 40,),
                  for(int i=0;i<questions1[index].answer!.length;i++)
                    Container(
                      width: double.infinity,

                      margin: EdgeInsets.only(bottom: 30.0),
                      child: MaterialButton(
                        color: ispressed? questions1[index].answer!.entries.toList()[i].value?
                        trueanser:isWrong :secondcolor,
                        onPressed:
                        ispressed? (){}
                            :
                            (){
                          setState(() {
                            ispressed=true;
                          });
                          if(questions1[index].answer!.entries.toList()[i].value){

                            score+=10;
                            print(score);
                          }
                        },
                        shape: StadiumBorder(),
                        padding: EdgeInsets.all(20.0),

                        child: Text(questions1[index].answer!.keys.toList()[i],
                          style: TextStyle(color: Colors.white,fontSize: 19),),

                      ),
                    ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(onPressed: ispressed?index+1==questions.length ?(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>resultscreen(
                          score: score,)));
                      }:

                          (){

                        _controller?.nextPage(duration: Duration(milliseconds: 300), curve:Curves.linear);
                      }:null,


                          child: Text(index+1==questions1.length ?
                          "See result":"Next Question",

                            style: TextStyle(color: Colors.white,fontSize: 19),)),
                    ],
                  ),

                ],
              );
            }

        ),
      ),
    );
  }
}
