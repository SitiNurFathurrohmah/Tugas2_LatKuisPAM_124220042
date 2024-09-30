import 'package:flutter/material.dart';
import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String? _nickname;
  String password = "";
  bool isClicked = false;

  // Function
  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(username: username, nickname: _nickname),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Halaman Login"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            usernameField(),
            passwordField(),
            nicknameField(), // Add nickname field here
            _LoginButton(context),
          ],
        ),
      ),
    );
  }

  Widget usernameField() {
    return Container(
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          onChanged: (value) {
            username = value;
          },
          decoration: const InputDecoration(
            hintText: 'Masukkan Username',
            contentPadding: const EdgeInsets.all(8.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }

  Widget passwordField() {
    return Container(
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          obscureText: true,
          onChanged: (value) {
            password = value;
          },
          decoration: const InputDecoration(
            hintText: 'Masukkan Password',
            contentPadding: const EdgeInsets.all(8.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }

  Widget nicknameField() {
    return Container(
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          enabled: true,
          onChanged: (value) {
            _nickname = value;
          },
          decoration: const InputDecoration(
            hintText: 'Masukkan Panggilan',
            contentPadding: const EdgeInsets.all(8.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }

  Widget _LoginButton(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: isClicked
              ? MaterialStateProperty.all(Colors.blue)
              : MaterialStateProperty.all(Colors.pink[300]),
        ),
        onPressed: () {
          if (username == 'sifa' && password == '123') {
            _navigateToHome();

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Login Anda Berhasil'),
              ),
            );
            setState(() {
              isClicked = !isClicked;
            });
          }
        },
        child: const Text('Login'),
      ),
    );
  }
}
