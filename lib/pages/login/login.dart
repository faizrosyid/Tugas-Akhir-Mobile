import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news/main.dart';
import 'package:news/partials/button_login.dart';
import 'package:news/partials/input_login.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String datetime = DateTime.now().year.toString();
  bool hide = true;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login(String username, String password) async {
    try {
      final response = await post(
        Uri.parse("#"),
        headers: {
          "Access-Control-Allow-Origin": "*",
        },
        body: {
          "username": username,
          "password": password,
        },
      );

      if (context.mounted) {
        if (response.statusCode == 200) {
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          final String username = responseData['username'];
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(
                      username: username,
                    )),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Username atau password salah!"),
            ),
          );
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 130,
            ),
            Column(
              children: [
                const Image(
                  image: AssetImage('assets/images/NewsPNG.png'),
                  height: 150,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Username",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'MontserratSemi',
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                InputLogin(
                  controller: usernameController,
                  decoration: const InputDecoration(
                      hintText: "Type here...",
                      icon: Icon(
                        Icons.person,
                        color: Colors.indigo,
                      ),
                      border: InputBorder.none),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Password",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'MontserratSemi',
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 15,
                ),
                InputLogin(
                  controller: passwordController,
                  obscure: hide,
                  decoration: InputDecoration(
                      hintText: "Type here...",
                      icon: const Icon(
                        Icons.lock,
                        color: Colors.indigo,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            hide = !hide;
                          });
                        },
                        child: Icon(
                          hide ? Icons.visibility_off : Icons.visibility,
                          color: Colors.indigo,
                        ),
                      ),
                      border: InputBorder.none),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonLogin(
                  onpress: () async {
                    login(usernameController.text, passwordController.text);
                  },
                  fore: Colors.white,
                  back: Colors.orangeAccent,
                  side: Colors.grey,
                  title: Text(
                    "Login".toUpperCase(),
                    style: const TextStyle(fontFamily: 'MontserratSemi'),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
