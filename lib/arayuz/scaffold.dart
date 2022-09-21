import 'package:flutter/material.dart';
import 'package:flutter_calismalarim/arayuz/tapbarsayfasi.dart';
import 'package:flutter_calismalarim/sayfalar/arsiv.dart';
import 'package:flutter_calismalarim/sayfalar/bilgilendirme.dart';
import 'package:flutter_calismalarim/sayfalar/degerlendirme.dart';

class Deneme extends StatefulWidget {
  const Deneme({super.key});

  @override
  State<StatefulWidget> createState() => DenemeState();
}

class DenemeState extends State<Deneme> {
  final GlobalKey<ScaffoldState> _keyscaffold = GlobalKey<ScaffoldState>();
  int gecerlisayfa = 0;
  bool acikmi = false;
  sayfadegistir(int suankisayfa) {
    switch (suankisayfa) {
      case 0:
        return const Arsivsayfa();
      case 1:
        return const Bilgilendirmesayfasi();
      case 2:
        return const Degerlendirmesayfasi();
      default:
        return const Arsivsayfa();
    }
  }

  void _orneksnackbar(String i) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$i butonuna bastın"),
        duration: const Duration(seconds: 1),
      ),
    ); //snackbara buton koyup işlem yapabilirsin
  }

  void _ornekbottomsheet() {
    if (acikmi) {
      Navigator.pop(context);
      acikmi = false;
    } else if (!acikmi) {
      acikmi = true;
      _keyscaffold.currentState!.showBottomSheet((BuildContext ctx) {
        return Container(
          height: 250,
          color: Colors.amber,
          child: ListView(
            physics:
                const ClampingScrollPhysics(), //boş kısımlara hareket etmesini engellemek için
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.place),
                title: const Text("Tap Bar Sayfası"),
                trailing: const Icon(Icons.arrow_right),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const Tapbarsayfa(
                          baslik: "Ana Sayfadan Geldim",
                        ),
                      ));
                },
              ),
              const Divider(
                height: 2,
                color: Colors.blue,
              ),
              ListTile(
                leading: const Icon(Icons.access_alarm),
                title: const Text("Alarm"),
                trailing: const Icon(Icons.arrow_right),
                onTap: () => Navigator.pop(context),
              ),
              const Divider(
                height: 2,
                color: Colors.blue,
              ),
              ListTile(
                leading: const Icon(Icons.android),
                title: const Text("Uygulamalarımız"),
                trailing: const Icon(Icons.arrow_right),
                onTap: () => Navigator.pop(context),
              ),
              const Divider(
                height: 2,
                color: Colors.blue,
              ),
              ExpansionTile(
                leading: const Icon(Icons.adjust),
                title: const Text("Hakkımızda"),
                trailing: const Icon(Icons.arrow_right),
                children: <Widget>[
                  ListTile(
                    title: const Text("Biz Kimiz"),
                    onTap: () => Navigator.pop(context),
                  ),
                  ListTile(
                    title: const Text("Sertifikalar"),
                    onTap: () => Navigator.pop(context),
                  ),
                  ListTile(
                    title: const Text("Misyonumuz"),
                    onTap: () => Navigator.pop(context),
                  ),
                ],
              ),
            ],
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _keyscaffold,
        appBar: AppBar(
          title: const Text("Merhaba Flutter"),
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons
                  .playlist_play), //icon isimlerine material icons.com dan bakabilirsin
              tooltip: "Buton1",
              onPressed: () => _ornekbottomsheet(),
            ),
            PopupMenuButton(
                onSelected: (secilen) {
                  switch (secilen) {
                    case 0:
                      _orneksnackbar("Paylaş");
                      break;
                    case 1:
                      _orneksnackbar("Puan Ver");
                      break;
                    case 2:
                      _orneksnackbar("İletişim");
                      break;
                    default:
                      debugPrint(secilen.toString());
                  }
                },
                icon: const Icon(Icons.more_vert),
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry>[
                    const PopupMenuItem(
                      value: 0, //selecteda düşer
                      child: ListTile(
                        leading: Icon(Icons.share),
                        title: Text("Paylaş"),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 1,
                      child: ListTile(
                        leading: Icon(Icons.star),
                        title: Text("Puan ver"),
                      ),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: ListTile(
                        leading: Icon(Icons.contact_phone),
                        title: Text("İletişim"),
                      ),
                    ),
                  ];
                }),
          ],
        ),
        body: sayfadegistir(gecerlisayfa),
        bottomNavigationBar: BottomNavigationBar(
          ///type: BottomNavigationBarType.fixed,
          type:
              BottomNavigationBarType.shifting, //geçiş animasyonunu değiştirir
          currentIndex: gecerlisayfa,
          backgroundColor: Colors.purple,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.archive),
                label: "Arşivim",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.announcement),
                label: "Bilgilendirme",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.assessment),
                label: "Değerlendirme",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: "Bilgi",
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.image),
                label: "Resimler",
                backgroundColor: Colors.blue),
          ],
          onTap: (int i) {
            gecerlisayfa = i;
            setState(() {});
          },
        ),
        /*BottomAppBar(
        color: Colors.blueAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.info_outline), 
              onPressed: null
            ),
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.widgets), 
              onPressed: null
            ),
            IconButton(
              color: Colors.white,
              icon: Icon(Icons.add_to_home_screen), 
              onPressed: null
            ),
          ],
        ),
      ),*/
        backgroundColor: Colors.red.shade100,
        drawer: Container(
          margin: const EdgeInsets.only(top: 20),
          child: Drawer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 120,
                  width: double.maxFinite,
                  color: Colors.blue,
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: FlutterLogo(
                        size: 80,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    physics:
                        const ClampingScrollPhysics(), //boş kısımlara hareket etmesini engellemek için
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.place),
                        title: const Text("Tap Bar Sayfası"),
                        trailing: const Icon(Icons.arrow_right),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => const Tapbarsayfa(
                                  baslik: "Ana Sayfadan Geldim",
                                ),
                              ));
                        },
                      ),
                      const Divider(
                        height: 2,
                        color: Colors.blue,
                      ),
                      ListTile(
                        leading: const Icon(Icons.access_alarm),
                        title: const Text("Alarm"),
                        trailing: const Icon(Icons.arrow_right),
                        onTap: () => Navigator.pop(context),
                      ),
                      const Divider(
                        height: 2,
                        color: Colors.blue,
                      ),
                      ListTile(
                        leading: const Icon(Icons.android),
                        title: const Text("Uygulamalarımız"),
                        trailing: const Icon(Icons.arrow_right),
                        onTap: () => Navigator.pop(context),
                      ),
                      const Divider(
                        height: 2,
                        color: Colors.blue,
                      ),
                      ExpansionTile(
                        leading: const Icon(Icons.adjust),
                        title: const Text("Hakkımızda"),
                        trailing: const Icon(Icons.arrow_right),
                        children: <Widget>[
                          ListTile(
                            title: const Text("Biz Kimiz"),
                            onTap: () => Navigator.pop(context),
                          ),
                          ListTile(
                            title: const Text("Sertifikalar"),
                            onTap: () => Navigator.pop(context),
                          ),
                          ListTile(
                            title: const Text("Misyonumuz"),
                            onTap: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )

        /*floatingActionButton: new FloatingActionButton(
        onPressed: () => debugPrint("Action butona basıldı"), 
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      persistentFooterButtons: <Widget>[],
      drawer: ,
      endDrawer: ,
      bottomSheet: ,
      resizeToAvoidBottomPadding: true,
      primary: true,*/
        );
  }
}
