import 'package:flutter/material.dart';
import 'package:wallyhub/widgets/api.dart';
import 'package:wallyhub/widgets/catblock.dart';
import 'package:wallyhub/widgets/searchbar.dart';
import 'package:wallyhub/widgets/widgets.dart';
import 'package:wallyhub/modals/photosmodal.dart';

import 'fullscreen.dart';

class Search extends StatefulWidget {
  String query;
  Search({super.key, required this.query});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<PhotosModal> searchlist = [];

  searchwally() async {
    searchlist = await Apioperation.searchwall(widget.query);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    searchwally();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Appbarr(),
        elevation: 1.0,
        backgroundColor: Colors.blue[100],
      ),
      body: Column(
        children: [
          Searchbar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 300,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: searchlist.length,
                  itemBuilder: ((context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Fullscreen(
                                        imgsrc: searchlist[index].imgsrc,
                                      )));
                        },
                        child: Container(
                          height: 10,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              searchlist[index].imgsrc,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ))),
            ),
          )
        ],
      ),
    );
  }
}
