import 'package:auth_buttons/auth_buttons.dart';
import 'package:firebase128demo/services/auth_services.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            email(),
            password(),
            loginbutton(),
            registerbutton(),
            googlebutton(),
          ],
        ),
      ),
    );
  }

  Container email() {
    return Container(
      margin: const EdgeInsets.only(left: 32, right: 32, top: 250, bottom: 2),
      child: TextFormField(
        controller: _email,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter Your E-mail';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: Colors.indigo, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: Colors.indigo, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          prefixIcon: Icon(
            Icons.email_rounded,
            color: Colors.indigo,
          ),
          label: Text(
            'E-mail',
            style: TextStyle(color: Colors.indigo),
          ),
        ),
      ),
    );
  }

  Container password() {
    return Container(
      margin: const EdgeInsets.only(left: 32, right: 32, top: 5, bottom: 10),
      child: TextFormField(
        controller: _password,
        obscureText: true,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please Enter Your Password';
          }
          return null;
        },
        decoration: const InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: Colors.indigo, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: Colors.indigo, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
            borderSide: BorderSide(color: Colors.red, width: 2),
          ),
          prefixIcon: Icon(
            Icons.password_rounded,
            color: Colors.indigo,
          ),
          label: Text(
            'Password',
            style: TextStyle(color: Colors.indigo),
          ),
        ),
      ),
    );
  }

  Widget loginbutton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: SizedBox(
        width: 270,
        child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
              ),
            ),
            onPressed: () {
              loginUser(_email.text, _password.text);
            },
            child: const Text('Login')),
      ),
    );
  }

  SizedBox registerbutton() {
    return SizedBox(
      width: 270,
      child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
          onPressed: () {
            registerWithEmail(_email.text, _password.text);
          },
          child: const Text('Rrgister')),
    );
  }

  Widget googlebutton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: SizedBox(
        width: 200,
        child: GoogleAuthButton(
          onPressed: () {
            signInWithGoogle();
          },
          darkMode: false,
        ),
      ),
    );
  }
}
