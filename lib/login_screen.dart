import 'package:flutter/material.dart';
import 'package:ots_pocket/registration_screen.dart';
import 'package:ots_pocket/widget_util/image_util.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordState = true;
  vis() {
    setState(() {
      passwordState = !passwordState;
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 32.0, bottom: 32.0, left: 32.0, right: 32.0),
            child: Column(
              children: [
                const Center(
                    child: ImageUtil(
                  width: 200.0,
                  height: 160.0,
                  path: "asset/images/logo.jpeg",
                )),
                const SizedBox(
                  height: 40.0,
                ),
                const Text(
                  "Welcome",
                  style: TextStyle(
                      fontSize: 26.0,
                      color: Color(0xFF000000),
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                  "OTS-Pocket Login Page",
                  style: TextStyle(
                      fontSize: 13.0,
                      color: Color(0xFF717171),
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      hintText: "example@ot-software.com",
                      labelText: "Email Id"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Username cannot not be empty";
                    }
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                      return ("Please Enter a valid email");
                    }
                    return null;
                  },
                  onSaved: (value) {
                    emailController.text = value!;
                  },
                ),
                const SizedBox(
                  height: 32.0,
                ),
                TextFormField(
                  obscureText: passwordState,
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      hintText: "Password",
                      labelText: "Password",
                      suffixIcon: InkWell(
                          onTap: vis, child: const Icon(Icons.visibility))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password cannot not be empty";
                    } else if (value.length < 8) {
                      return "Password length should be at list 8";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    passwordController.text = value!;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forget Password?",
                      style: TextStyle(
                          fontSize: 13.0,
                          color: Color(0xFF157B4F),
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                        fontSize: 18.0,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.bold),
                    minimumSize: const Size.fromHeight(48.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0)),
                    backgroundColor: const Color(0xFFD4D4D8),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegistrationScreen()));
                  },
                  child: const Text(
                    "Login",
                  ),
                ),
                const SizedBox(
                  height: 48.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                  child: Row(children: const [
                    Expanded(
                      flex: 5,
                      child: Divider(color: Color(0xFFD4D4D8), thickness: 1.0),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Text(
                        "OR",
                        style: TextStyle(
                            fontSize: 11.0,
                            color: Color(0xFF717171),
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      flex: 5,
                      child: Divider(color: Color(0xFFD4D4D8), thickness: 1.0),
                    )
                  ]),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                RichText(
                  text: const TextSpan(children: <TextSpan>[
                    TextSpan(
                      text: "Don't have an account yet? ",
                      style: TextStyle(
                          fontSize: 13.0,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w400),
                    ),
                    TextSpan(
                      text: "Register Now",
                      style: TextStyle(
                          fontSize: 13.0,
                          color: Color(0xFF157B4F),
                          fontWeight: FontWeight.w400),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
