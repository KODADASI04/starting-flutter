import 'dart:io';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class Kayityeri {
  //Uygulamanın dosya yolunu alması
  Future<String> get dosyakonumu async {
    final konum = await getApplicationDocumentsDirectory();
    return konum.path;
  }

  //Dosya oluşturma
  Future<File> get yereldosya async {
    final yol = await dosyakonumu;
    return File("$yol/yenidosya.txt");
  }

  //Dosya okuma
  Future<String> dosyaoku() async {
    try {
      final dosya = await yereldosya;
      String icerik = await dosya.readAsString();
      return icerik;
    } catch (h) {
      return "Dosya okunurken hata oldu $h";
    }
  }

  //Dosyaya yazma
  Future<File> dosyayaz(String gicerik) async {
    final dosya = await yereldosya;
    return dosya.writeAsString(gicerik);
  }
}

class Uygulamadosya extends StatefulWidget {
  final Kayityeri? kayitislemleri;

  const Uygulamadosya({Key? key, this.kayitislemleri}) : super(key: key);

  @override
  State<StatefulWidget> createState() => UygulamaState();
}

class UygulamaState extends State<Uygulamadosya> {
  final yazikontrol = TextEditingController();
  final genelkontrol = GlobalKey<FormState>();
  String veri = "";
  Future<File> verikaydet() {
    if (genelkontrol.currentState!.validate()) {
      setState(() {
        veri = yazikontrol.text;
      });
    }
    return widget.kayitislemleri!.dosyayaz(veri);
  }

  void ilkacilma() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text(
                      "Bu uygulamanın Depolama Alanına Erişimine İzin Verilsin mi?")
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pushNamed(context, "/"),
                child: const Text("Reddet"),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("İzin Ver"),
              ),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
  } //ilk açılışta yapılacak komut

  void verioku() {
    widget.kayitislemleri!.dosyaoku().then((String deger) {
      setState(() {
        veri = deger;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Uygulama içi dosya oluşturma"),
      ),
      body: Form(
        key: genelkontrol,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (deger) {
                  if (deger!.isEmpty) {
                    return "Bu alanı doldurunuz";
                  } else {
                    return null;
                  }
                },
                decoration:
                    const InputDecoration(hintText: "Dosyaya Yazmak İstenen veri"),
                controller: yazikontrol,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextButton(
                        onPressed: () {
                          ilkacilma();
                          verikaydet();
                        },
                        child: const Text(
                          "Kaydet",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextButton(
                        child: const Text(
                          "Oku",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () => verioku(),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text("Veri: $veri"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
