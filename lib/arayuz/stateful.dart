import 'package:flutter/material.dart';

class Yeni extends StatefulWidget {
  const Yeni({super.key});

  @override
  State<StatefulWidget> createState() => Mypagestate();
}

class Mypagestate extends State<Yeni> {
  int sayi = 0;
  void artir() {
    setState(() {
      sayi++;
    });
  }

  void azalt() {
    setState(() {
      sayi--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Stateful Widgets"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: artir,
              child: const Text("Sayıyı artır"),
            ),
            Text(
              "Sayı:$sayi",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                fontSize: 25,
                color: sayi > 0
                    ? Colors.yellow
                    : sayi < 0
                        ? Colors.black
                        : Colors.white,
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: azalt,
              child: const Text("Sayıyı Azalt"),
            ),
          ],
        ),
      ),
    );
  }
}
