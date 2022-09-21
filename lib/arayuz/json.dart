import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as baglanti;
import 'dart:convert';

class Post {
  int? userid;
  int? id;
  String? title;
  String? body;
  Post({this.userid, this.id, this.title, this.body});
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userid: json["userid"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }
}

Future<Post> pgetir() async {
  final cevap = await baglanti
      .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"));
  if (cevap.statusCode == 200) {
    //200 ise başarılı anlamında
    return Post.fromJson(json.decode(cevap.body));
  } else {
    throw Exception(
        "Veriler alınırken hata oluştu.Hata Kodu:${cevap.statusCode}");
  }
}

class Jsonkonu extends StatelessWidget {
  const Jsonkonu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Json Konusu"),
      ),
      body: Center(
        child: FutureBuilder<Post>(
          future: pgetir(),
          builder: (context, deger) {
            if (deger.hasData) {
              int userid = deger.data!.userid!.toInt();
              int id = deger.data!.id!.toInt();
              String title = deger.data!.title.toString();
              String body = deger.data!.body.toString();
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Gelen User Id:$userid"),
                  Text("Gelen ID:$id"),
                  Text("Gelen Title:$title"),
                  Text("Gelen Body:$body"),
                ],
              );
            } else if (deger.hasError) {
              return Text("Hata Oluştu ${deger.error}");
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
