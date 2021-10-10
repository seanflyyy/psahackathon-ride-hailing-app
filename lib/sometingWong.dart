import 'package:flutter/material.dart';

class SomeTingWong extends StatefulWidget {
  const SomeTingWong({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  SomeTingWongState createState() => SomeTingWongState();
}

class SomeTingWongState extends State<SomeTingWong> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Text(widget.text),
            Image.network(
                "https://media.giphy.com/media/xAPX757CCJKKEdZevV/giphy.gif")],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ));
  }
}
