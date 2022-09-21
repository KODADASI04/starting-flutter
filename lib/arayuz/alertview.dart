import 'package:flutter/material.dart';

class Alertvetext extends StatefulWidget {
  const Alertvetext({super.key});

  @override
  State<StatefulWidget> createState() => Alertstate();
}

class Alertstate extends State<Alertvetext> {
  final kontrolcu = TextEditingController();
  final genelkontrolcu = GlobalKey<FormState>();
  void selamla() {
    if (genelkontrolcu.currentState!.validate()) {
      showDialog(
          context: context,
          barrierDismissible:
              false, //gelen uyarının dışına basıldığında kapanmaması için
          builder: (context) {
            return AlertDialog(
              title: const Text("Selamla "),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text("Merhaba ${kontrolcu.text}"),
                    const Text("Sizi sistem için selamlıyorum"),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    kontrolcu.text = "";
                  },
                  child: const Text("Tamam"),
                ),
              ],
            );
          });
    }
  }

  @override
  void dispose() {
    kontrolcu.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alertview ve TextField"),
      ),
      body: Form(
        key: genelkontrolcu,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (yazi) {
                  if (yazi!.isEmpty) {
                    return "Lütfen Burayı boş bırakmayın";
                  } else {
                    return null;
                  }
                },
                controller: kontrolcu,
                decoration: const InputDecoration(hintText: "İsminizi Yazınız"),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  style:
                      TextButton.styleFrom(backgroundColor: Colors.deepPurple),
                  onPressed: selamla,
                  child: const Text(
                    "Selamla",
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontFamily: "Acme-Regular.ttf",
                      fontSize: 30,
                    ),
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
