import 'package:flutter/material.dart';

class Appbarr extends StatelessWidget {
  const Appbarr({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: 'Wallpaper ',
              style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
          TextSpan(
              text: 'Hub',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: Colors.orange,
              ))
        ]),
      ),
    );
  }
}
