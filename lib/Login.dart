import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualifflutter/Homepage.dart';
import 'package:provider/provider.dart';
import 'package:qualifflutter/Theme.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  void handleLogin() {
    String email = emailController.text.toString();
    String password = passwordController.text.toString();
    log(email);
    if (password.length == 0 || email.length == 0) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("Email and password can't be empty"),
              icon: const Icon(Icons.error),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"))
              ],
            );
          });
    } else if (!email.contains("@")) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("Email is wrong format"),
              icon: const Icon(Icons.error),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"))
              ],
            );
          });
    } else if (email.contains(RegExp(r'[A-Z]'))) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("Email can't contain capital letter"),
              icon: const Icon(Icons.error),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"))
              ],
            );
          });
    }
    else{
      
          Navigator.push(context, MaterialPageRoute(builder: ((context) {
            return Homepage(email: emailController.text);
          })));
        
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: const Text("Watson"),
      backgroundColor: themeProvider.getTheme.secondaryHeaderColor,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/watson_logo.png"),
            SizedBox(
              width: 250,
              child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: "Email")),
            ),
            Container(
                alignment: Alignment.topCenter,
                child: SizedBox(
                    width: 250,
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                    ))),
            ElevatedButton(onPressed: handleLogin, child: Text("Login"))
          ],
        ),
      ),
    );
  }
}
