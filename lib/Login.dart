import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualifflutter/Homepage.dart';
import 'package:provider/provider.dart';
import 'package:qualifflutter/Register.dart';
import 'package:qualifflutter/Theme.dart';

import 'User.dart';
import 'main.dart';

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
    bool found = false;
    bool passwordMatch = false;
    for(User u in Users){
      if(u.username == email){
        found = true;
        if(u.password == password){
          passwordMatch = true;
        }
      }
    }
    if (found == false ) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("Email is not registered"),
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
    else if(found == true && passwordMatch==false){
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Error"),
              content: const Text("Invalid password"),
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
            SizedBox(
              child: Image.asset("assets/watson_logo.png"), 
              height: MediaQuery.of(context).size.height*0.5
            ),
            
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
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: handleLogin, child: Text("Login")),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return Register();
                })));
              },
              child: Text("Don't have account? Register"),
            ),
          ],
        ),
      ),
    );
  }
}
