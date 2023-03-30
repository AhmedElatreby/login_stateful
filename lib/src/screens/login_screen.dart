import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(
              margin: EdgeInsets.only(top: 25.0),
            ),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(Icons.email),
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: emailValidation,
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.password),
        labelText: 'Password',
        hintText: 'Password',
      ),
      validator: passwordValidation,
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(10.0),
        primary: Colors.lightBlue,
        onPrimary: Colors.black45,
      ),
      child: Text('Submit!'),
      onPressed: () {
        print(formKey.currentState?.validate());
      },
    );
  }

  String? emailValidation(value) {
    if (!value!.contains('@')) {
      return 'Please Enter a valid email';
    }
    return null;
  }

  String? passwordValidation(value) {
    if (value!.length < 4) {
      return 'Password must be at least 4 characters';
    }
  }
}
