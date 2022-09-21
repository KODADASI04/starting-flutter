import 'package:flutter/material.dart';
import 'package:lamp/lamp.dart';
import 'dart:async';

class Flasuygulama extends StatefulWidget {
  const Flasuygulama({super.key});

  @override
  State<StatefulWidget> createState() => Flasuygulamastate();
}

class Flasuygulamastate extends State<Flasuygulama> {
  bool _flasvarmi = false;
  bool _flasacikmi = false;
  double _siddeti = 1;
  String ampul = "kapali";
  String buton = "Aç";
  @override
  void initState() {
    ilkacilis();
    super.initState();
  }

  ilkacilis() async {
    bool flasvarmi = await Lamp.hasLamp;
    setState(() {
      _flasvarmi = flasvarmi;
    });
  }

  Future _feneriac() async {
    if (_flasvarmi) {
      if (_flasacikmi) {
        Lamp.turnOff();
        ampul = "kapali";
        buton = "Aç";
      } else {
        Lamp.turnOn(intensity: _siddeti);
        ampul = "acik";
        buton = "Kapat";
      }
    }

    var f = await Lamp.hasLamp;
    setState(() {
      _flasvarmi = f;
      _flasacikmi = !_flasacikmi;
    });
  }

  _siddetiDegistir(double siddet) {
    Lamp.turnOn(intensity: siddet);
    setState(() {
      _siddeti = siddet;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("El Feneri"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/$ampul.png"),
          TextButton(
            child: Text("Fener $buton"),
            onPressed: () => _feneriac(),
          ),
          Slider(
            value: _siddeti,
            onChanged: _flasacikmi ? _siddetiDegistir : null,
          ),
        ],
      ),
    );
  }
}
