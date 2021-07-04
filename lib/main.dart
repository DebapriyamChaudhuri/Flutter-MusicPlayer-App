import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/colors.dart';

import 'album_art.dart';
import 'nav_bar.dart';

void main() {
  runApp(MaterialApp(
    title: 'Music Player',
    theme: ThemeData(fontFamily: 'Circular'),
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;


    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: <Widget>[
          NavBar(),
          Container(
            height: height/2.5,
            child: ListView.builder(itemBuilder: (context, index){
              return AlbumArt();
            },
              itemCount: 3,
              scrollDirection: Axis.horizontal,
            ),
          ),
        ],
      ),
    );
  }
}
