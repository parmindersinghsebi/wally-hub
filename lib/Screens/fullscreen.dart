import 'package:flutter/material.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'dart:io';

class Fullscreen extends StatelessWidget {
  String imgsrc;

  Fullscreen({super.key, required this.imgsrc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 50),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(imgsrc), fit: BoxFit.cover)),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text(
                  'Set as Home Screen',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () async {
                  int location = WallpaperManager.HOME_SCREEN;
                  var file = await DefaultCacheManager()
                      .getSingleFile(imgsrc); //can be Home/Lock Screen
                  bool result = await WallpaperManager.setWallpaperFromFile(
                      file.path, location);
                  Navigator.pop(context);
                },
              ),
              TextButton(
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 20, horizontal: 10)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Text(
                  'Set as Lock Screen',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () async {
                  int location = WallpaperManager.LOCK_SCREEN;
                  var file = await DefaultCacheManager()
                      .getSingleFile(imgsrc); //can be Home/Lock Screen
                  bool result = await WallpaperManager.setWallpaperFromFile(
                      file.path, location);

                  Navigator.pop(context);
                },
              ),
            ]),
      ),
    );
  }
}
