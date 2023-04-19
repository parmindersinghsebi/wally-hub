import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Screens/cato.dart';

class Catblock extends StatelessWidget {
  String category;
  String imglink;
  Catblock({super.key, required this.category, required this.imglink});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      child: InkWell(
        child: Stack(children: [
          Container(
            width: 100,
            height: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                  fit: BoxFit.cover, height: 50, width: 100, imglink),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black45, borderRadius: BorderRadius.circular(10)),
            height: 50,
            width: 100,
          ),
          Positioned(
            left: 10,
            top: 10,
            child: Text(
              category,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          )
        ]),
        onTap: () => {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => Cato(name: category)))
        },
      ),
    );
  }
}
