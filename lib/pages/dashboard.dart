import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fquizres/authentction/loginmainscreen.dart';
import 'package:fquizres/pages/homepage.dart';
import 'package:fquizres/pages/homepage1.dart';

import '../authentction/loginscreen.dart';



class landingpage extends StatelessWidget {
  landingpage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser??"";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 300),
                child: Text(
                  "Hello",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Text(
                "Welcome",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 24),
              ),
            ],
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Colors.deepOrange, Colors.purple],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          )),
        ),
        elevation: 0,
        title: Text("F-QUIZ"),
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: 12,
          )
        ],
      ),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.grey.shade200,
        ),
        child: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Hello"),
                accountEmail: Text("Welcome"),
                currentAccountPicture: CircleAvatar(
                    child: Image(
                  image: NetworkImage(
                      'https://cdn4.iconfinder.com/data/icons/logos-brands-5/24/flutter-512.png'),
                )),
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
              ),
              ListTile(
                title: Text("hompage"),
                trailing: Icon(Icons.menu),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => landingpage()));
                },
              ),
              ListTile(
                title: Text("settings"),
                trailing: Icon(Icons.menu),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>gridviewbilder()));
                },
              ),
              ListTile(
                title: Text("RATE US"),
                trailing: Icon(Icons.menu),
                onTap: () {
                  Navigator.of(context).pop();
                  // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>ListView()));
                },
              ),
              Divider(
                thickness: 10.0,
              ),
              Center(
                child: Center(
                  child: ListTile(
                    title: Text("SIGNOUT"),
                    trailing: Icon(Icons.menu),
                    onTap:() {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => loginscreen()));
                      FirebaseAuth.instance.signOut();

                    }
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.withOpacity(.9),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: (1 / .9),
            ),
            children: [
              GestureDetector(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> homepag())),
            child:  Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      CupertinoIcons.book_circle,
                      color: Colors.white,
                      size: 80,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "NEWBEE",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              ),
              GestureDetector(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> homepag1())),
           child:   Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      CupertinoIcons.book_circle,
                      color: Colors.white,
                      size: 80,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "INTER",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),),
              GestureDetector(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> homepag())),
            child:  Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      CupertinoIcons.book_circle,
                      color: Colors.white,
                      size: 80,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "ADVANCED",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),),
              GestureDetector(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> homepag1())),
            child:  Container(
                decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      CupertinoIcons.book_circle,
                      color: Colors.white,
                      size: 80,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "PRO",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),),
              GestureDetector(
              //  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> resultscreen(score:Landing,))),
            child:  Container(
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      CupertinoIcons.check_mark_circled,
                      color: Colors.white,
                      size: 80,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "SCORE",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),),
              Container(
                decoration: BoxDecoration(
                  color: Colors.pinkAccent,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Icon(
                      CupertinoIcons.info,
                      color: Colors.white,
                      size: 80,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "ABOUT US",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

