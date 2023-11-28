import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news/main.dart';
import 'package:news/pages/login.dart';
import 'package:news/partials/button_login.dart';
import 'package:news/partials/input_login.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String datetime = DateTime.now().year.toString();
  bool hide = true;
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> register(String name, String username, String password) async {
    try {
      final response = await post(
        Uri.parse("http://192.168.0.205/news/register.php"), // Ubah endpoint ke register.php
        headers: {
          "Content-Type": "application/x-www-form-urlencoded", // Atur tipe konten yang sesuai
        },
        body: {
          "name": name,
          "username": username,
          "password": password,
        },
      );

      if (context.mounted) {
        if (response.statusCode == 200) {
          final Map<String, dynamic> responseData = jsonDecode(response.body);
          final String username = responseData['username'];
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Center(child: Text("Registration Success!")),
                backgroundColor: Colors.green,
              ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Center(child: Text("Registration Failed!")),
              backgroundColor: Colors.red,
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
              height: 40,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 36.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ));
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                        ),
                        child: const Text(
                          "Back",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
                const SizedBox(height: 10,),
                const Image(
                  image: AssetImage('assets/images/NewsPNG.png'),
                  height: 150,
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "REGISTER",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'MontserratSemi',
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 11,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 49.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Name",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'MontserratSemi',
                          fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InputLogin(
                  controller: nameController,
                  decoration: const InputDecoration(
                      hintText: "Type here...",
                      icon: Icon(
                        Icons.person_2_outlined,
                        color: Colors.indigo,
                      ),
                      border: InputBorder.none),
                ),
                const SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 49.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Username",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'MontserratSemi',
                          fontSize: 16),
                    ),
                  ),
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
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 49.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Password",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'MontserratSemi',
                          fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
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
                  height: 30,
                ),
                ButtonLogin(
                  onpress: () async {
                    register(nameController.text, usernameController.text, passwordController.text);
                  },
                  fore: Colors.white,
                  back: Colors.pink,
                  side: Colors.grey,
                  title: Text(
                    "Register".toUpperCase(),
                    style: const TextStyle(fontFamily: 'MontserratSemi'),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
