import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news/main.dart';
import 'package:news/pages/register.dart';
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
        Uri.parse("http://192.168.0.11/news/login.php"),
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
          final String name = responseData['name'];
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(
                      name: name,
                    )),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Center(child: Text("Username atau password salah!")),
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
              height: 100,
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
                  "LOGIN",
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
                ElevatedButton(
                  onPressed: () {
                    login(
                      usernameController.text,
                      passwordController.text,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink, // Warna latar belakang (pink)
                    onPrimary: Colors.white, // Warna teks (putih)
                    side: BorderSide(color: Colors.white), // Warna garis tepi (putih)
                  ),
                  child: Text(
                    "LOGIN",
                    style: TextStyle(
                      fontFamily: "MontserratSemi",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Register()),
                    );
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      fontFamily: 'MontserratSemi',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
