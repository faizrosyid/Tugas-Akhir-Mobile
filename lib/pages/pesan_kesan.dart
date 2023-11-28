import 'package:flutter/material.dart';

class PesanKesan extends StatefulWidget {
  const PesanKesan({super.key});

  @override
  State<PesanKesan> createState() => _PesanKesanState();
}

class _PesanKesanState extends State<PesanKesan> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Column(
              children: [
                const Text(
                  "Pesan dan Kesan",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const Text(
                  "Pemrograman Aplikasi Mobile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 303,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListView(
                children: const [
                  ListTile(
                    title: Center(
                      child: Text(
                        "Pesan",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    subtitle: Text(
                      "Pelan-pelan pak supir. Besok jangan ngebut lagi ya. Praktikum baru start, yang teori udah setengah jalan. \n#mendingperlahantapipasti",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  ListTile(
                    title: Center(
                      child: Text(
                        "Kesan",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    subtitle: Text(
                      "Pembelajaran yang tidak spaneng. Satu-satunya kelas yang membebaskan mahasiswanya terkait kehadiran, tugas, dan ujian.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
