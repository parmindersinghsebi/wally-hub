import 'package:flutter/material.dart';

import '../Screens/search.dart';

class Searchbar extends StatelessWidget {
  Searchbar({Key? key}) : super(key: key);
  TextEditingController _control = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 30),
        decoration: BoxDecoration(
          color: Color.fromARGB(66, 192, 192, 192),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(children: [
          Expanded(
            child: TextField(
              controller: _control,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: (_control.text == '')
                      ? 'Search Wallpaper'
                      : _control.text),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Search(
                            query: _control.text,
                          )));
            },
            child: Icon(Icons.search),
          )
        ]),
      ),
    );
  }
}
