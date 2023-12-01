import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String content;
  final String image;
  final String publishedAt;
  final String url;
  const DetailPage(
      {super.key,
      required this.title,
      required this.content,
      required this.image,
      required this.publishedAt,
      required this.url});

  @override
  Widget build(BuildContext context) {
    DateTime tanggal = DateTime.parse(publishedAt);
    DateFormat format = DateFormat("dd MMMM yyyy HH:mm");
    String tanggalWaktu = format.format(tanggal);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
          color: Colors.white,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.indigo,
        onPressed: () {
          launchUrl(Uri.parse(url));
        },
        child: const Icon(
          Icons.launch,
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 200),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 10,
                ),
                Text("$tanggalWaktu UTC", style: const TextStyle(fontSize: 12)),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  content,
                  style: const TextStyle(fontSize: 14),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
