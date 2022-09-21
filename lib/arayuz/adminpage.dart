import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:flutter_calismalarim/myDB/services.dart';
import 'package:flutter_calismalarim/myDB/veri.dart';

class Mysqlactions extends StatefulWidget {
  const Mysqlactions({super.key});

  @override
  MysqlactionsState createState() => MysqlactionsState();
}

class MysqlactionsState extends State<Mysqlactions> {
  late List<Veri> _veri;
  final TextEditingController _usernamekontrol = TextEditingController();
  final TextEditingController _passwordkontrol = TextEditingController();
  final TextEditingController _aboutkontrol = TextEditingController();
  Veri _verisec = Veri();
  String _title = "Admin Page";
  bool _yukleme = false;
  @override
  void initState() {
    super.initState();
    _verial();
  }

  _showtitle(String mesaj) {
    setState(() {
      _title = mesaj;
    });
  }

  _tabloyarat() {
    _showtitle("Tablo Oluşturuluyor");
    Services.tabloyarat().then((result) {
      if (result == "success") {
        Toast.show("Tablo Oluşturuldu");
        _showtitle("Admin Page");
      }
    });
  }

  _verial() {
    _showtitle("Veriler Alınıyor");
    Services.verial().then((veriler) {
      setState(() {
        _veri = veriler;
      });
      _showtitle("Admin Page");
    });
  }

  _veriekle() {
    if (_usernamekontrol.text.isEmpty ||
        _passwordkontrol.text.isEmpty ||
        _aboutkontrol.text.isEmpty) {
      return;
    }
    _showtitle("Veri Ekleniyor");
    Services.veriekle((_veri.length++).toString(), _usernamekontrol.text,
            _passwordkontrol.text, _aboutkontrol.text)
        .then((result) {
      if (result == "success") {
        _verial();
        Toast.show("Veri Eklendi");
        _showtitle("Admin Page");
      }
      _temizle();
    });
  }

  _veriduzenle(Veri veri) {
    _showtitle("Veri Düzenleniyor");
    setState(() {
      _yukleme = true;
    });
    Services.veriduzenle(veri.id.toString(), _usernamekontrol.text,
            _passwordkontrol.text, _aboutkontrol.text)
        .then((result) {
      if (result == "success") {
        _verial();
        Toast.show("Veri Düzenlendi");
        _showtitle("Admin Page");
      }
      _temizle();
    });
    setState(() {
      _yukleme = false;
    });
  }

  _verisil(Veri veri) {
    _showtitle("Veri Siliniyor");
    Services.verisil(veri.id.toString()).then((result) {
      if (result == "success") {
        _verial();
        Toast.show("Veri Silindi");
        _showtitle("Admin Page");
      }
    });
  }

  _temizle() {
    _usernamekontrol.text = "";
    _passwordkontrol.text = "";
    _aboutkontrol.text = "";
  }

  _degergoster(Veri veri) {
    _usernamekontrol.text = veri.username.toString();
    _passwordkontrol.text = veri.pass.toString();
    _aboutkontrol.text = veri.about.toString();
  }

  SingleChildScrollView _databody() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: const [
            DataColumn(
              label: Text("ID"),
            ),
            DataColumn(
              label: Text("USERNAME"),
            ),
            DataColumn(
              label: Text("PASSWORD"),
            ),
            DataColumn(
              label: Text("ABOUT"),
            ),
            DataColumn(
              label: Text("DELETE"),
            ),
          ],
          rows: _veri
              .map<DataRow>(
                (veri) => DataRow(
                  cells: [
                    DataCell(Text(veri.id.toString()), onTap: () {
                      _degergoster(veri);
                      _verisec = veri;
                      setState(() {
                        _yukleme = true;
                      });
                    }),
                    DataCell(Text(veri.username.toString()), onTap: () {
                      _degergoster(veri);
                      _verisec = veri;
                      setState(() {
                        _yukleme = true;
                      });
                    }),
                    DataCell(Text(veri.pass.toString()), onTap: () {
                      _degergoster(veri);
                      _verisec = veri;
                      setState(() {
                        _yukleme = true;
                      });
                    }),
                    DataCell(Text(veri.about.toString()), onTap: () {
                      _degergoster(veri);
                      _verisec = veri;
                      setState(() {
                        _yukleme = true;
                      });
                    }),
                    DataCell(IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () => _verisil(veri),
                    ))
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  _yukleniyor() {
    return const CircularProgressIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _tabloyarat();
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => _verial(),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              validator: (deger) {
                if (deger!.isEmpty) {
                  return "Bu alanı doldurmak zorunlu";
                } else {
                  return null;
                }
              },
              controller: _usernamekontrol,
              decoration: const InputDecoration(
                  icon: Icon(Icons.people), hintText: "Kullanıcı Adı"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              validator: (deger) {
                if (deger!.isEmpty) {
                  return "Bu alanı doldurmak zorunlu";
                } else {
                  return null;
                }
              },
              controller: _passwordkontrol,
              decoration: const InputDecoration(
                  icon: Icon(Icons.vpn_key), hintText: "Şifre"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              validator: (deger) {
                if (deger!.isEmpty) {
                  return "Bu alanı doldurmak zorunlu";
                } else {
                  return null;
                }
              },
              controller: _aboutkontrol,
              decoration: const InputDecoration(
                  icon: Icon(Icons.info), hintText: "Açıklama"),
            ),
          ),
          _yukleme
              ? Row(
                  children: <Widget>[
                    TextButton(
                        child: const Text("Güncelle"),
                        onPressed: () {
                          _veriduzenle(_verisec);
                          _yukleme = false;
                        }),
                    TextButton(
                      child: const Text("İptal"),
                      onPressed: () {
                        setState(() {
                          _yukleme = false;
                        });
                        _temizle();
                      },
                    ),
                  ],
                )
              : Container(),
          _veri == null
              ? _yukleniyor()
              : Expanded(
                  child: _databody(),
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _veriekle(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
