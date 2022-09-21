import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';

class Mysqldeneme extends StatefulWidget {
  const Mysqldeneme({super.key});

  @override
  MysqldenemeState createState() => MysqldenemeState();
}

class MysqldenemeState extends State<Mysqldeneme> {
  String deger = "";
  String mesaj = "";
  TextEditingController usernamekontrol = TextEditingController();
  TextEditingController passwordkontrol = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  login() async {
    final response = await http.get(
        Uri.parse("http://192.168.1.5/mysql/getData.php"),
        headers: {"Accept": "application/json"});
    var datauser = json.decode(response.body);
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: FutureBuilder(
        future: login(),
        builder: (context, AsyncSnapshot snapshot) {
          List snap = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error fetching data"),
            );
          } else {
            return Form(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 200),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 9),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          padding: const EdgeInsets.only(
                              top: 4, left: 10, right: 10, bottom: 4),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                )
                              ]),
                          child: TextFormField(
                            controller: usernamekontrol,
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.person,
                                  color: Colors.black,
                                ),
                                hintText: "Kullanıcı Adı"),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 50,
                          margin: const EdgeInsets.only(top: 12),
                          padding: const EdgeInsets.only(
                              top: 4, left: 10, right: 10, bottom: 4),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 5,
                                )
                              ]),
                          child: TextFormField(
                            obscureText: true,
                            controller: passwordkontrol,
                            decoration: const InputDecoration(
                                icon: Icon(
                                  Icons.vpn_key,
                                  color: Colors.black,
                                ),
                                hintText: "Şifre"),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(top: 6, right: 12),
                            child: Text("Beni Hatırla"),
                          ),
                        ),
                        //Spacer(),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {
                            for (int index = 0;
                                index < snap.length;
                                index++) {
                              if (snap[index]["username"] ==
                                      usernamekontrol.text &&
                                  snap[index]["password"] ==
                                      passwordkontrol.text &&
                                  snap[index]["about"] == "admin") {
                                debugPrint("admin");
                                Navigator.pushReplacementNamed(
                                    context, "/adminpage");
                              }
                              if (snap[index]["username"] ==
                                      usernamekontrol.text &&
                                  snap[index]["password"] ==
                                      passwordkontrol.text &&
                                  snap[index]["about"] == "user") {
                                debugPrint("user");
                                Navigator.pushReplacementNamed(context, "/");
                              } else {
                                Toast.show("Kullanıcı Bulunamadı");
                              }
                            }
                          },
                          child: const Text("Giriş"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
