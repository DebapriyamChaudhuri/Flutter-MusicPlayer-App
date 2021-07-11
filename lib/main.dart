import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_player/colors.dart';
import 'package:music_player/model/myaudio.dart';
import 'package:music_player/player_control.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'album_art.dart';
import 'nav_bar.dart';

void main() {
  runApp(MaterialApp(
    title: 'Music Player',
    theme: ThemeData(fontFamily: 'Circular'),
    debugShowCheckedModeBanner: false,
    home: ChangeNotifierProvider(
        create: (_)=>MyAudio(),
        child: HomePage()),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double sliderValue = 2;


  Map audioData = {

    'url':'https://www.mfiles.co.uk/mp3-downloads/beethoven-symphony7-2-liszt-piano.mp3'
  };

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          NavBar(),
          Container(
            height: height / 2.5,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return AlbumArt();
              },
              itemCount: 3,
              scrollDirection: Axis.horizontal,
            ),
          ),
          Text(
            'Beethoven',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: darkPrimaryColor),
          ),
          Text(
            'Ludwig van Beethoven',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: darkPrimaryColor),
          ),
          SliderTheme(
            data: SliderThemeData(
              trackHeight: 5,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),

            ),
            child: Consumer<MyAudio>(
              builder: (_,myAudioModel,child)=>
              Slider(
                value: myAudioModel.position==null? 0: myAudioModel.position!.inMilliseconds.toDouble(),
                activeColor: darkPrimaryColor,
                inactiveColor: darkPrimaryColor.withOpacity(0.5),
                onChanged: (value) {
                  myAudioModel.seekAudio(Duration(milliseconds: value.toInt()));

                },
                min: 0,
                max: myAudioModel.totalDuration==null? 20: myAudioModel.totalDuration!.inMilliseconds.toDouble(),
              ),
            ),
          ),
          PlayerControls(),
          SizedBox(
            height: 70,
          )

        ],
      ),
    );
  }
}
