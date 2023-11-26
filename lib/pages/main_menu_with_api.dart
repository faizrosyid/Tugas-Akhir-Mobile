import 'package:flutter/material.dart';
import 'package:news/pages/detail_page.dart';
import 'package:news/apinews.dart';


class MainMenuApi extends StatefulWidget {
  final String username;
  const MainMenuApi({Key? key, required this.username});

  @override
  State<MainMenuApi> createState() => _MainMenuApiState();
}

class _MainMenuApiState extends State<MainMenuApi> {
  late Future<List<News>> futureNews;
  late Future<List<News>> futureTechNews;

  @override
  void initState() {
    super.initState();
    futureNews = fetchStudents();
    futureTechNews = fetchTechNews();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(),
              const Text(
                "Berita Terbaru",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 270,
                child: FutureBuilder<List<News>>(
                  future: futureTechNews, // Menggunakan futureTechNews untuk Berita Terbaru
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length > 10 ? 10 : snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return beritaTerbaru(
                            context,
                            snapshot.data![index].title!,
                            snapshot.data![index].description!,
                            snapshot.data![index].urlToImage!,
                            snapshot.data![index].publishedAt!,
                            snapshot.data![index].url!,
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Berita Populer",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Expanded(
                child: SizedBox(
                  child: FutureBuilder<List<News>>(
                    future: futureNews,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: 25,
                          itemBuilder: (context, index) {
                            return beritaPopuler(
                              context,
                              snapshot.data![index].title!,
                              snapshot.data![index].description!,
                              snapshot.data![index].urlToImage!,
                              snapshot.data![index].publishedAt!,
                              snapshot.data![index].url!,
                            );
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }

                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector beritaPopuler(BuildContext context, String title, String desc,
      String image, String publishedAt, String url) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(
            title: title,
            content: desc,
            image: image,
            publishedAt: publishedAt,
            url: url,
          ),
        ),
      ),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(
                height: 100,
                width: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      desc,
                      style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector beritaTerbaru(BuildContext context, String title, String desc,
      String image, String publishedAt, String url) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DetailPage(
              title: title,
              content: desc,
              image: image,
              publishedAt: publishedAt,
              url: url,
            );
          },
        ));
      },
      child: SizedBox(
        height: 260,
        width: 250,
        child: Card(
          elevation: 3,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                  width: 250,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  desc,
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
