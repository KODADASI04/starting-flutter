import 'package:flutter/material.dart';

class Anacard extends StatelessWidget {
  final String rota;
  final String yazi;
  const Anacard(this.rota,this.yazi, {super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, rota),
      child: Card(
        child: Container(
          alignment: Alignment.center,
          color: Colors.blue.shade100,
          margin: const EdgeInsets.all(5),
          child: Text(
            yazi,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
