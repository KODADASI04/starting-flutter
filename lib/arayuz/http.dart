import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Httpders extends StatefulWidget {
  const Httpders({super.key});

  @override
  State<StatefulWidget> createState() => Httpstate();
}

class Httpstate extends State<Httpders> {
  var veri = "";
  getislemi() {
    http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1"))
        .then((cevap) {
      debugPrint(cevap.statusCode.toString());
      debugPrint(cevap.body.length.toString());
      setState(() {
        veri = cevap.body;
      });
    });
  }

  postislemi() {
    http.post(Uri.parse("https://jsonplaceholder.typicode.com/posts"), body: {
      "title": "flutter dersi",
      "body": "ben geldim",
      "userId": "1"
    }).then((cevap) {
      debugPrint(cevap.statusCode.toString());
      debugPrint(cevap.body);
      setState(() {
        veri = cevap.body;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Basit Http İşlemleri"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.yellow),
                onPressed: () => getislemi(),
                child: const Text("Get Metodu"),
              )),
              Expanded(
                  child: TextButton(
                style: TextButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () => postislemi(),
                child: const Text("Post Metodu"),
              )),
            ],
          ),
          Expanded(
            child: Center(
              child: ListView(
                children: <Widget>[
                  Text(
                    "Gelen veri:$veri",
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
