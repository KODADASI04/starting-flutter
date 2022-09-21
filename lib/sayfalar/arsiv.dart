import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:flutter_calismalarim/widget/anacard.dart';

class Arsivsayfa extends StatelessWidget {
  const Arsivsayfa({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        physics:
            const ClampingScrollPhysics(), //boş kısımlara doğru hareket etmesini engellemek için
        primary: false,
        padding: const EdgeInsets.all(1),
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/ilksayfa"),
            child: Card(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/autumn.jpg"),
                    //image: NetworkImage(url)
                    fit: BoxFit.cover,
                  ),
                ),
                //color: Colors.blue.shade100,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(5),
                child: Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.skewY(0)..rotateZ(0),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    color:
                        const Color(0xFFFFEEDD), //opak(00 saydam),kırmızı,mavi,yeşil
                    child: const Text(
                      "Tek Tıklama\nİlk sayfaya git",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onDoubleTap: () => Navigator.pushNamed(context, "/hello"),
            child: Card(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue.shade100,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  """Çift Tıklama 
  Satır Sütunların olduğu sayfaya git
                    """,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onLongPress: () => Navigator.pushNamed(context, "/stateful"),
            child: Card(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue.shade100,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  """Uzun Basma
Stateful sayfasına git
                  """,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, "/imageview"),
            child: Card(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue.shade100,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  "Imageview sayfasına git",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Toast.show("Toast Message",
                  duration: Toast.lengthLong, gravity: Toast.bottom);
            },
            child: Card(
              child: Container(
                alignment: Alignment.center,
                color: Colors.blue.shade100,
                margin: const EdgeInsets.all(5),
                child: const Text(
                  "Toast Message oluşturma",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          const Anacard("/alertview", "TextField ve AlertView\nSayfasına git"),
          const Anacard("/shared", "Shared Preferences Sayfasına Git"),
          const Anacard("/uygulamaiçidosya", "Uygulama içi dosya sayfasına git"),
          const Anacard("/json", "Json Sayfasına git"),
          const Anacard("/localjson", "Local json sayfasına git"),
          const Anacard("/http", "HTTP sayfasına git"),
          const Anacard("/flas", "Flaş Uygulaması"),
          const Anacard("/animasyon", "Animasyon Uygulaması"),
          const Anacard("/loginsayfa", "Login Sayfa"),
          const Anacard("/adminpage", "Mysql Page")
        ],
      ),
    );
  }
}
