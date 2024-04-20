import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class NewsDetails extends StatelessWidget {
  String image;
  String title;
  String content;
  String url;
  NewsDetails({required this.image , required this.title , required this.content , required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: Text(
          "News App",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(image ?? "")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title ?? "",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                content ?? "",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                    fontSize: 15),
              ),
            ),
            InkWell(
              onTap: (){
                launchUrl(Uri.parse(url));
              },
                child: Text(
              "View Full Article",textAlign: TextAlign.end,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            )),
          ],
        ),
      ),
    );
  }
  // Future<void> _launchURL(String url) async {
  //   final Uri uri = Uri(scheme: "https", host: url);
  //   if(!await launchUrl(
  //     uri,
  //     mode: LaunchMode.externalApplication,
  //   )) {
  //     throw "Can not launch url";
  //   }
  // }
}
