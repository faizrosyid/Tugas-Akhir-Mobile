import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/constant/constant.dart';
import 'package:news/pages/konversi_uang.dart';
import 'package:news/pages/konversi_waktu.dart';
import 'package:news/pages/login/login.dart';
import 'package:news/pages/main_menu_with_api.dart';
import 'package:news/pages/pesan_kesan.dart';
import 'package:news/pages/profile.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Login(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String username;

  const MyHomePage({super.key, required this.username});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedItem = 2;
  static BorderRadius borderMenu = BorderRadius.circular(20);

  void onItemTapped(int index) {
    setState(() {
      selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const KonversiUang(),
      const KonversiWaktu(),
      MainMenuApi(
        username: widget.username,
      ),
      const Profile(),
      const PesanKesan(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.indigo, Colors.deepPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 8, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome, ${widget.username}!",
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    OutlinedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ));
                        },
                        child: const Text(
                          "Logout",
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade200,
      bottomNavigationBar: myBottomNavbar(),
      body: pages[selectedItem],
    );
  }

  Padding myBottomNavbar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(2, 3),
              blurRadius: 2,
              spreadRadius: 2)
        ], borderRadius: borderMenu),
        child: ClipRRect(
          borderRadius: borderMenu,
          child: BottomNavigationBar(
              selectedLabelStyle: const TextStyle(fontSize: 12),
              currentIndex: selectedItem,
              selectedItemColor: myBlue,
              unselectedItemColor: myGreyBottom,
              onTap: onItemTapped,
              iconSize: 20,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/svg/bottom-menu/money.svg',
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                      colorFilter: selectedItem == 0
                          ? const ColorFilter.mode(Colors.blue, BlendMode.srcIn)
                          : null,
                    ),
                    label: 'Konversi Uang',
                    backgroundColor: Colors.white),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/svg/bottom-menu/clock.svg',
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                      colorFilter: selectedItem == 1
                          ? const ColorFilter.mode(Colors.blue, BlendMode.srcIn)
                          : null,
                    ),
                    label: 'Konversi Waktu',
                    backgroundColor: Colors.white),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/svg/bottom-menu/icon_home.svg',
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                      colorFilter: selectedItem == 2
                          ? const ColorFilter.mode(Colors.blue, BlendMode.srcIn)
                          : null,
                    ),
                    label: 'Main Menu',
                    backgroundColor: Colors.white),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/svg/bottom-menu/user.svg',
                      height: 25,
                      width: 25,
                      fit: BoxFit.fill,
                      colorFilter: selectedItem == 3
                          ? const ColorFilter.mode(Colors.blue, BlendMode.srcIn)
                          : null,
                    ),
                    label: 'Profil',
                    backgroundColor: Colors.white),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/images/svg/bottom-menu/form.svg',
                      height: 23,
                      width: 25,
                      fit: BoxFit.fill,
                      colorFilter: selectedItem == 4
                          ? const ColorFilter.mode(Colors.blue, BlendMode.srcIn)
                          : null,
                    ),
                    label: 'Pesan & Kesan',
                    backgroundColor: Colors.white),
              ]),
        ),
      ),
    );
  }
}
