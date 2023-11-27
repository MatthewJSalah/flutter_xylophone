import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:audioplayers/audioplayers.dart';

//Run app
void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {

  //Function to play sound
  void playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(
      AssetSource("note$soundNumber.wav"),
    );
  }

  //Function to build button widgets
  Expanded buildKey(int sound, Color pickedColour) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(pickedColour),
        ),
        onPressed: () {
          playSound(sound);
        },
        child: Container(),
      ),
    );
  }

  //Build App
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              buildKey(1, Colors.red),
              buildKey(2, Colors.yellow),
              buildKey(3, Colors.teal),
              buildKey(4, Colors.purple),
              buildKey(5, Colors.blue),
              buildKey(6, Colors.orange),
              buildKey(7, Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}
