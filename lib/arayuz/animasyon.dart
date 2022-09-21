import 'package:flutter/material.dart';

class Yazihareket extends StatefulWidget {
  const Yazihareket({super.key});

  @override
  YazihareketState createState() => YazihareketState();
}

class YazihareketState extends State<Yazihareket>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut)
      ..addListener(() => setState(() {}))
      ..addStatusListener((durum) {
        debugPrint(durum.toString());
      });
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animasyon")),
      body: Center(
        child: Text(
          "Hareketli Yazı",
          style: TextStyle(fontSize: _animation.value * 20),
        ),
      ),
    );
  }
}
