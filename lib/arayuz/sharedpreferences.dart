import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class Sharedkonu extends StatefulWidget {
  const Sharedkonu({super.key});

  @override
  State<StatefulWidget> createState() => SharedState();
}

class SharedState extends State<Sharedkonu> {
  final isimkontrolcu = TextEditingController();
  final parolakontrolcu = TextEditingController();
  final genelkontrolcu = GlobalKey<FormState>();
  String isim = "";
  String parola = "";
  bool? kayitdurum = false;
  int kayitsayi = 0;
  void kayityap(String isimim, String parolam) async {
    final kayitaraci = await SharedPreferences.getInstance();
    if (genelkontrolcu.currentState!.validate()) {
      kayitsayi++;
      kayitaraci.setBool("durum", true);
      kayitaraci.setInt("kayitno", kayitsayi);
      kayitaraci.setString("isim", isimim);
      kayitaraci.setString("parola", parolam);
      Toast.show(
        "Kayıt Başarılı bir şeklide gerçekleşti",
        duration: Toast.lengthLong,
        gravity: Toast.bottom,
      );
    }
  }

  void kayitg() async {
    final kayitaraci = await SharedPreferences.getInstance();
    String kisim = kayitaraci.getString("isim").toString();
    String kparola = kayitaraci.getString("parola").toString();
    bool? kdurum = kayitaraci.getBool("durum");
    int ksayi = kayitaraci.getInt("kayitno")!.toInt();
    setState(() {
      isimkontrolcu.text = kisim;
      parolakontrolcu.text = kparola;
      isim = kisim;
      parola = kparola;
      kayitdurum = kdurum;
      kayitsayi = ksayi;
    });
    Toast.show(
      "Kayıt Gösterildi",
      duration: Toast.lengthLong,
      gravity: Toast.bottom,
    );
  }

  void kayits() async {
    final kayitaraci = await SharedPreferences.getInstance();
    //tüm kayıtları silmek için kayitaraci.clear()
    kayitaraci.remove("durum");
    kayitaraci.remove("isim");
    kayitaraci.remove("parola");
    isimkontrolcu.text = "";
    parolakontrolcu.text = "";
    Toast.show(
      "Kayıt başarılı bir şekilde silindi",
      duration: Toast.lengthLong,
      gravity: Toast.bottom,
    );
  }

  @override
  void dispose() {
    isimkontrolcu.dispose();
    parolakontrolcu.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SharedPreferences konusu"),
      ),
      body: Form(
        key: genelkontrolcu,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (deger) {
                  if (deger!.isEmpty) {
                    return "Bu alanı doldurmak zorundasınız";
                  } else {
                    return null;
                  }
                },
                controller: isimkontrolcu,
                decoration: const InputDecoration(hintText: "İsminizi Girin"),
              ),
              TextFormField(
                validator: (deger) {
                  if (deger!.length < 4) {
                    return "Şifreniz 4 karakterden ve üzerinde olmalıdır";
                  } else {
                    return null;
                  }
                },
                controller: parolakontrolcu,
                decoration: const InputDecoration(hintText: "Parolanızı Girin"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextButton(
                        onPressed: () =>
                            kayityap(isimkontrolcu.text, parolakontrolcu.text),
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.green),
                        child: const Text(
                          "Beni Hatırla",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextButton(
                        onPressed: () => kayitg(),
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.green),
                        child: const Text(
                          "Getir",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextButton(
                        onPressed: () => kayits(),
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.green),
                        child: const Text(
                          "Sil",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text("İsim:$isim "),
                      Text("Parola:$parola "),
                      Text("Kayıt Durumu:$kayitdurum "),
                      Text("Kayıt Numarası:$kayitsayi "),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
