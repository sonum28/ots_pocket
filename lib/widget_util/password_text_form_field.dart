import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController? passwordController;

  const PasswordTextFormField({@required this.passwordController, Key? key})
      : super(key: key);

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isPasswordEncryptedState = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPasswordEncryptedState,
      controller: widget.passwordController,
      keyboardType: TextInputType.visiblePassword,
      maxLength: 12,
      style: TextStyle(
        fontSize: 16.0,
        color: Color(0xFF000000),
      ),
      decoration: InputDecoration(
        counterText: '',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        hintText: "Password",
        hintStyle: TextStyle(
          fontSize: 16.0,
          color: Color(0xFF919191),
        ),
        labelText: "Password",
        suffixIcon: InkWell(
          onTap: passwordDecrypted,
          child: const Icon(
            Icons.visibility,
            color: Color(0xFF000000),
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Password is required";
        } else if (value.length < 8) {
          return "Password length should be at list 8";
        }
        return null;
      },
    );
  }

  passwordDecrypted() {
    setState(() {
      isPasswordEncryptedState = !isPasswordEncryptedState;
    });
  }
}
