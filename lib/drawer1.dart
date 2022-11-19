import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ots_pocket/contactus.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';
import 'main.dart';

class MyDrower1 extends StatefulWidget {
  @override
  _MyDrower1 createState() => _MyDrower1();
}

class _MyDrower1 extends State<MyDrower1> {
  @override
  void initState() {
    super.initState();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                            "https://firebasestorage.googleapis.com/v0/b/ots-pocket.appspot.com/o/projectFiles%2FUntitled%20design%20(1).png?alt=media&token=cb14e7f7-2edf-4fd8-9f38-71ff120ade7d"),
                      ),
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, boxShadow: [
                        BoxShadow(
                          offset: Offset(-20, 20),
                          color: Colors.red,
                          blurRadius: 20,
                          spreadRadius: -10,
                        ),
                        BoxShadow(
                          offset: Offset(-20, -20),
                          color: Colors.orange,
                          blurRadius: 20,
                          spreadRadius: -10,
                        ),
                        BoxShadow(
                          offset: Offset(20, -20),
                          color: Colors.blue.shade800,
                          blurRadius: 20,
                          spreadRadius: -10,
                        ),
                        BoxShadow(
                          offset: Offset(20, 20),
                          color: Colors.deepPurple,
                          blurRadius: 20,
                          spreadRadius: -10,
                        )
                      ]),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Deepayan Nandy",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "dny@gmail.com",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  offset: Offset(-20, 20),
                  color: Colors.red,
                  blurRadius: 20,
                  spreadRadius: -10,
                ),
                BoxShadow(
                  offset: Offset(-20, -20),
                  color: Colors.orange,
                  blurRadius: 20,
                  spreadRadius: -10,
                ),
                BoxShadow(
                  offset: Offset(20, -20),
                  color: Colors.blue.shade800,
                  blurRadius: 20,
                  spreadRadius: -10,
                ),
                BoxShadow(
                  offset: Offset(20, 20),
                  color: Colors.deepPurple,
                  blurRadius: 20,
                  spreadRadius: -10,
                )
              ]),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      CupertinoIcons.moon,
                      size: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      "Change to Dark mode",
                      textScaleFactor: 1,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onTap: () {
                      Fluttertoast.showToast(msg: "Change to Dark Mode");
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      CupertinoIcons.settings,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                    title: Text(
                      "Manage Profile",
                      textScaleFactor: 1,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(
                      CupertinoIcons.hand_draw,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                    title: Text(
                      "About Us",
                      textScaleFactor: 1,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onTap: () async {},
                  ),
                  ListTile(
                    leading: Icon(
                      CupertinoIcons.person,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                    title: Text(
                      "Contact Us",
                      textScaleFactor: 1,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ContactUs()));
                    },
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.logout_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 20,
                    ),
                    title: Text(
                      "Log Out",
                      textScaleFactor: 1,
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onTap: () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          backgroundColor:
                              Theme.of(context).scaffoldBackgroundColor,
                          title: const Text('Logout'),
                          content:
                              const Text('Are you sure you want to Logout!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('No'),
                            ),
                            TextButton(
                              onPressed: () {
                                logout(context);
                              },
                              child: const Text('Yes'),
                            ),
                          ],
                        ),
                      );

                      // title:Text("Logout") ,
                      // content:Text("Are you sure you want to logout?"),
                      // actions: [
                      //   ElevatedButton(onPressed: (){
                      //   Navigator.pop(context);
                      //   },child: Text("No")),
                      //   ElevatedButton(onPressed: (){
                      //
                      //   }, child: Text("Yes"))
                      // ],
                    },
                  ),
                ],
              ),
            ),
            Container(
                child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Column(
                      children: <Widget>[
                        // Divider(),
                        ListTile(
                            // leading: Icon(
                            //   CupertinoIcons.heart,
                            //   color: Colors.white,
                            // ),
                            title: Text(
                          "A Product of OT-Software LLC",
                          textScaleFactor: 1,
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        )),
                      ],
                    ))),
          ],
        ),
      ),
    );
  }

  logout(BuildContext context) {
    Navigator.pop(context);
    appStorage?.deleteEncryptedData('token');
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(pageBuilder: (BuildContext context,
            Animation animation, Animation secondaryAnimation) {
          return LoginScreen();
        }, transitionsBuilder: (BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child) {
          return new SlideTransition(
            position: new Tween<Offset>(
                    begin: const Offset(1.0, 0.0), end: Offset.zero)
                .animate(animation),
            child: child,
          );
        }),
        (route) => false);
  }

  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Simple Alert"),
      content: Text("This is an alert message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
