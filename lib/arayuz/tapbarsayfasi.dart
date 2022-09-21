import 'package:flutter/material.dart';

class Tapbarsayfa extends StatefulWidget {
  final String? baslik;
  const Tapbarsayfa({super.key, this.baslik});
  @override
  TapbarsayfaState createState() => TapbarsayfaState();
}

class TapbarsayfaState extends State<Tapbarsayfa> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.baslik.toString() != null
              ? widget.baslik.toString()
              : "Tap Bar Sayfası"),
          bottom: const TabBar(
            tabs: <Widget>[
              Icon(Icons.face),
              Text("Tap Bar"),
              Icon(Icons.alternate_email),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(color: Colors.lime),
            Container(color: Colors.teal),
            Container(color: Colors.lightGreen),
          ],
        ),
      ),
    );
  }
}
