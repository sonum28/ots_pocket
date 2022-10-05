import 'package:flutter/material.dart';

import 'widget_util/image_util.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController selectBranchController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController ssnController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordState = true;
  vis() {
    setState(() {
      passwordState = !passwordState;
    });
  }

  @override
  void dispose() {
    selectBranchController.dispose();
    designationController.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    ssnController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5.0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Color(0XFF000000),),
        ),
      ),
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
                "Register Yourself",
                style: TextStyle(
                    fontSize: 26.0,
                    color: Color(0xFF000000),
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 8.0,
              ),
              const Text(
                "to OTS-Pocket",
                style: TextStyle(
                    fontSize: 13.0,
                    color: Color(0xFF717171),
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 32.0,
              ),

              TextFormField(
                controller: selectBranchController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    hintText: "Bangalore",
                    labelText: "Select Branch"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Select Branch cannot not be empty";
                  }
                  return null;
                },
                onSaved: (value) {
                  emailController.text = value!;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: designationController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    hintText: "HR",
                    labelText: "Designation"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Designation cannot not be empty";
                  }
                  return null;
                },
                onSaved: (value) {
                  emailController.text = value!;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    hintText: "Mohammad Sonu",
                    labelText: "Full Name"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Name cannot not be empty";
                  }
                  return null;
                },
                onSaved: (value) {
                  nameController.text = value!;
                },
              ),
              const SizedBox(
                height: 16.0,
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
                height: 16.0,
              ),
              TextFormField(
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    hintText: "93XXXXXX53",
                    labelText: "Phone Number"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Phone Number cannot not be empty";
                  }
                  return null;
                },
                onSaved: (value) {
                  phoneNumberController.text = value!;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: ssnController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    hintText: "12XXXXXX90",
                    labelText: "SSN Number"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "SSN Number cannot not be empty";
                  }
                  return null;
                },
                onSaved: (value) {
                  phoneNumberController.text = value!;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                obscureText: passwordState,
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                    hintText: "Password",
                    labelText: "Password",
                    suffixIcon:
                        InkWell(onTap: vis, child: const Icon(Icons.visibility))),
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
                height: 16.0,
              ),
              RichText(
                text: const TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: "Back to ",
                    style: TextStyle(
                        fontSize: 13.0,
                        color: Color(0xFF000000),
                        fontWeight: FontWeight.w400),
                  ),
                  TextSpan(
                    text: "Login",
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
    );
  }
}
