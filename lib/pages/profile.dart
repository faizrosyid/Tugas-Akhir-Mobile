import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.indigo,
            child: CircleAvatar(
              radius: 45,
              backgroundImage: AssetImage("assets/images/faiz.jpg"),
            ),
          ),
          const Text(
            "Faiz Rosyid Ma'ruf",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              children: [
                Text(
                  "Mahasiswa UPN \"Veteran\" Yogyakarta",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Haloo! Namaku Faiz Rosyid Ma'ruf, kalian bisa memanggilku Faiz. Usiaku sekarang 20 tahun. Aku bertempat tinggal di Sleman, Daerah Istimewa Yogyakarta. Aku saat ini sedang menempuh S1 di UPN \"Veteran\" Yogyakarta. Doain ya gais, semoga aku dapat lulus tepat waktu dengan hasil yang maksimal. Yukk sama-sama semangat!",
                  style: TextStyle(fontSize: 14),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
