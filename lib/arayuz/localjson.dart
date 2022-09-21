import 'package:flutter/material.dart';
import 'dart:convert';

class Localjson extends StatefulWidget {
  const Localjson({super.key});

  @override
  State<StatefulWidget> createState() => LocaljsonState();
}

class LocaljsonState extends State<Localjson> {
  List ogrenciler = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Local Json Konusu")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
      child: FutureBuilder(
        future: DefaultAssetBundle.of(context)
            .loadString("assets/datalar/sinif.json"),
        builder: (context, cevap) {
          ogrenciler = jsonDecode(cevap.data.toString());
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text("Öğrencinin adı:${ogrenciler[index]["adı"]}"),
                    Text(
                        "Öğrencinin soyadı:${ogrenciler[index]["soyadı"]}"),
                    Text(
                        "Öğrencinin okul numarası:${ogrenciler[index]["okulno"]}"),
                    Text(
                        "Öğrencinin cinsiyeti:${ogrenciler[index]["cinsiyeti"]}"),
                    Text(
                        "Öğrencinin başarı durumu:${ogrenciler[index]["başarılı"]}"),
                    Text(
                        "Öğrencinin veli adı:${ogrenciler[index]["veli"]["adı"]}"),
                  ],
                ),
              );
            },
            itemCount: ogrenciler == null ? 0 : ogrenciler.length,
          );
        },
      ),
        ),
      ),
    );
  }
}
