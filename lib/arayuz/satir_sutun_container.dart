import 'package:flutter/material.dart';
class Sscon extends StatelessWidget {
  const Sscon({super.key});

  @override
  Widget build(BuildContext context){
    /*
    return new Center(
      child: new Text(
        "Merhaba Flutter",
        textDirection : TextDirection.ltr,
      ),
    );
    */
    return Container(
      color: Colors.green,
      alignment: Alignment.center,
      
      child: Container(
        margin: const EdgeInsets.all(20),//diğer widgetler ile arasında olacak uzaklık
        padding: const EdgeInsets.all(15),
        color: Colors.blue,
        alignment: Alignment.center,
        child: Container(
          color: Colors.brown,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            textDirection: TextDirection.ltr,
            verticalDirection: VerticalDirection.down,
            textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  verticalDirection: VerticalDirection.down,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      color: Colors.red.shade300,
                      margin: const EdgeInsets.all(5),
                      child: const Text(
                        "Merhaba",
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.red.shade300,
                      margin: const EdgeInsets.all(5),
                      child: const Text(
                        "Merhaba",
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.red.shade300,
                      margin: const EdgeInsets.all(5),
                      child: const Text(
                        "Merhaba",
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ],
                ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  verticalDirection: VerticalDirection.down,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      color: Colors.red.shade300,
                      margin: const EdgeInsets.all(5),
                      child: const Text(
                        "Merhaba",
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.red.shade300,
                      margin: const EdgeInsets.all(5),
                      child: const Text(
                        "Merhaba",
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.red.shade300,
                      margin: const EdgeInsets.all(5),
                      child: const Text(
                        "Merhaba",
                        textDirection: TextDirection.ltr,
                      ),
                    ),
                  ],
                ),
              ],
          ),
        ),
      ),
    );

  }
}