import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

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
              child: Column(
                children: [
                  const Text(
                    "Sedikit Tentangku",
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Haloo! Namaku Faiz Rosyid Ma'ruf, kalian bisa memanggilku Faiz. Usiaku sekarang 20 tahun. Aku bertempat tinggal di Sleman, Daerah Istimewa Yogyakarta. Aku saat ini sedang menempuh S1 di UPN \"Veteran\" Yogyakarta. Doain ya gais, semoga aku dapat lulus tepat waktu dengan hasil yang maksimal. Yukk sama-sama semangat!",
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          _launchURLInstagram();
                        },
                        icon: Icon(FontAwesomeIcons.instagram),
                      ),
                      IconButton(
                        onPressed: () {
                          _launchURLFacebook();
                        },
                        icon: Icon(FontAwesomeIcons.facebook),
                      ),
                      IconButton(
                        onPressed: () {
                          _launchURLWhatsApp();
                        },
                        icon: Icon(FontAwesomeIcons.whatsapp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchURLInstagram() async {
    const url = 'https://instagram.com/_faizrosyid';
    try {
      await launch(url);
    } catch (e) {
      print('Error launching Instagram: $e');
    }
  }

  void _launchURLFacebook() async {
    const url = 'https://www.facebook.com/profile.php?id=100004131708288';
    try {
      await launch(url);
    } catch (e) {
      print('Error launching Faceboook: $e');
    }
  }

  void _launchURLWhatsApp() async {
    const url = 'https://wa.me/6289648569366';
    try {
      await launch(url);
    } catch (e) {
      print('Error launching WhatsApp: $e');
    }
  }
}
