import 'package:flutter/material.dart';
class Resim extends StatelessWidget{
  const Resim({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("ImageView Kullanımı"),
      ),
      body: ListView(
        children: <Widget>[
          const Text("Asset Resmi",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600
            ),
            textAlign: TextAlign.center,
          ),
          Image.asset("assets/images/foto.png"),
          const Text("Fade Holder Resmi",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600
            ),
            textAlign: TextAlign.center,
          ),
          const FadeInImage(placeholder: AssetImage("assets/images/foto.png"), image: AssetImage("assets/images/autumn.jpg"))
          //İlk önceki resim sonra diğer resim yükleniyor bu komutla
        ],
      ),//aşagı inebilmek için
    );
  }
  static asset(String s) {}
}