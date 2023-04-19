import 'package:flutter/material.dart';
import 'package:wallyhub/Screens/fullscreen.dart';
import 'package:wallyhub/widgets/api.dart';
import 'package:wallyhub/widgets/catblock.dart';
import 'package:wallyhub/widgets/searchbar.dart';
import 'package:wallyhub/widgets/widgets.dart';
import 'package:wallyhub/modals/photosmodal.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    gettrendingwall();
    getcatlogimg();
  }

  List<String> category = [
    'Bike',
    'Cars',
    'Nature',
    'Street',
    'Coding',
    'Mountains',
    'Trees',
    'River',
    'Sports',
    'Chess'
  ];
  List<String> cating = [];
  getcatlogimg() async {
    for (int i = 0; i < category.length; i++) {
      List<PhotosModal> p = await Apioperation.searchwall(category[i]);
      cating.add(p[0].imgsrc);
    }
    setState(() {
      isloading = false;
    });
  }

  List<PhotosModal> trendingwall = [];
  gettrendingwall() async {
    trendingwall = await Apioperation.gettrending();
    setState(() {});
  }

  bool isloading = true;
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
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Searchbar(),
                isloading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: ((context, index) => Container(
                                  width: 100,
                                  height: 50,
                                  child: Catblock(
                                    category: category[index],
                                    imglink: cating[index],
                                  ),
                                ))),
                      ),
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
                        itemCount: trendingwall.length,
                        itemBuilder: ((context, index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Fullscreen(
                                              imgsrc:
                                                  trendingwall[index].imgsrc,
                                            )));
                              },
                              child: Hero(
                                tag: trendingwall[index].imgsrc,
                                child: Container(
                                  height: 10,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      trendingwall[index].imgsrc,
                                      fit: BoxFit.cover,
                                    ),
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
