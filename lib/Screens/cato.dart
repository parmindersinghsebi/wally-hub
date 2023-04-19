import 'package:flutter/material.dart';
import 'package:wallyhub/widgets/api.dart';
import 'package:wallyhub/widgets/catblock.dart';
import 'package:wallyhub/widgets/searchbar.dart';
import 'package:wallyhub/widgets/widgets.dart';
import 'package:wallyhub/modals/photosmodal.dart';

import 'fullscreen.dart';

class Cato extends StatefulWidget {
  String name;

  Cato({super.key, required this.name});

  @override
  State<Cato> createState() => _CatoState();
}

class _CatoState extends State<Cato> {
  List<PhotosModal> trend = [];
  bool isloading = true;
  searchwally() async {
    trend = await Apioperation.searchwall(widget.name);
    setState(() {
      isloading = false;
    });
  }

  @override
  void initState() {
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
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Stack(children: [
                  Image.network(
                    trend[0].imgsrc,
                    fit: BoxFit.cover,
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black26,
                    child: Column(children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Category",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        widget.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ]),
                  )
                ]),
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
                        itemCount: trend.length,
                        itemBuilder: ((context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Fullscreen(
                                              imgsrc: trend[index].imgsrc,
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
                                    trend[index].imgsrc,
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
