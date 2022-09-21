import 'package:flutter/material.dart';
import 'package:flutter_calismalarim/arayuz/adminpage.dart';
import 'package:flutter_calismalarim/arayuz/animasyon.dart';
import 'package:flutter_calismalarim/arayuz/flas.dart';
import 'package:flutter_calismalarim/arayuz/mysql.dart';
import './arayuz/alertview.dart';
import './arayuz/sharedpreferences.dart';
import './arayuz/stateful.dart';
import './arayuz/scaffold.dart';
import './arayuz/ilksayfa.dart';
import './arayuz/hello.dart';
import './arayuz/imageview.dart';
import './arayuz/uygulamadosya.dart';
import './arayuz/json.dart';
import './arayuz/localjson.dart';
import './arayuz/http.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": (context) => const Deneme(),
      "/ilksayfa": (context) => const Ilksayfa(
            title: "İlk sayfamız",
          ),
      "/hello": (context) => const Hello(),
      "/stateful": (context) => const Yeni(),
      "/imageview": (context) => const Resim(),
      "/alertview": (context) => const Alertvetext(),
      "/shared": (context) => const Sharedkonu(),
      "/uygulamaiçidosya": (context) => Uygulamadosya(
            kayitislemleri: Kayityeri(),
          ),
      "/json": (context) => const Jsonkonu(),
      "/localjson": (context) => const Localjson(),
      "/http": (context) => const Httpders(),
      "/flas": (context) => const Flasuygulama(),
      "/animasyon": (context) => const Yazihareket(),
      "/loginsayfa": (context) => const Mysqldeneme(),
      "/adminpage": (context) => const Mysqlactions(),
    },
    theme: ThemeData(
      fontFamily: "Inter-VariableFont_slnt,wght",
    ),
  ));
  /*runApp(new MaterialApp(
    title: "Merhaba",
    home: new Deneme(),
  ),
  );*/
}
//State = durum Stateless = Durumsuz ögeler uygulamaya boyunca uygulama içinden değişemeyen widgetler
//Statefull = Durumlu ögeler uygulama boyunca duruma göre değişebilen widgetler