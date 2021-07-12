import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MyAudio extends ChangeNotifier{
  Duration? totalDuration;
  Duration? position;
  String? audioState;

  MyAudio(){
    initAudio();
  }

  AudioPlayer audioPlayer = AudioPlayer();

  initAudio(){
    audioPlayer.onDurationChanged.listen((updatedDuration){
      totalDuration = updatedDuration;
      notifyListeners();
    });
    audioPlayer.onAudioPositionChanged.listen((updatedPostion){
      position = updatedPostion;
      notifyListeners();
    });

    audioPlayer.onPlayerStateChanged.listen((playerState){

      if (playerState == PlayerState.STOPPED){
        audioState = "Stopped";
      }
      if (playerState == PlayerState.PLAYING){
        audioState = "Playing";
      }
      if (playerState == PlayerState.PAUSED){
        audioState = "Paused";
      }
      notifyListeners();
    });

  }

  playAudio(){
    audioPlayer.play("https://www.mfiles.co.uk/mp3-downloads/beethoven-symphony7-2-liszt-piano.mp3");
  }

  pauseAudio(){
    audioPlayer.pause();
  }
  stopAudio(){
    audioPlayer.stop();
  }
  seekAudio(Duration durationToSeek){
    audioPlayer.seek(durationToSeek);

  }

}