import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Image.asset(
                  "assets/images/undraw_Contact_us_re_4qqt.png",
                  fit: BoxFit.cover,
                ),
                Text(
                  "Need Help, Contact us",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text:
                              'We are at OT-Software,always there to help you. We are extrimly sorry for the inconvinience. Call our support team or drop an email on the given phone number or email id. NOTE: Call facility is only availabe Monday to Friday 10 A.M to 6 P.M.',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Theme.of(context).iconTheme.color,
                            fontSize: 12,
                          ))),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Call Now: +1(281) 309-6484",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          //color: Colors.white,
                        )),
                  ),
                  onPressed: () async {
                    // launch('tel://+919027622164');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Mail Us: support@ot-software.com",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.white,
                        )),
                  ),
                  onPressed: () async {
                  //   final url = Mailto(
                  //     to: [
                  //       'info@vlsmarthome.com',
                  //     ],
                  //     subject: 'Customer Support',
                  //     body: 'Hey I need some help!',
                  //   ).toString();
                  //   if (await canLaunch(url)) {
                  //     await launch(url);
                  //   } else {
                  //     /* showCupertinoDialog(
                  //   context: context,
                  //   builder: MailClientOpenErrorDialog(url: url).build,
                  // ); */
                  //   }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor,
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    child: Text(
                      "Go Back",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
