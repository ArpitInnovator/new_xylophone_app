import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final AudioPlayer _player = AudioPlayer();

  Future<void> playSound(int soundNumber) async {
    try {
      final assetPath = 'note$soundNumber.wav';
      final player = AudioPlayer();
      await player.play(AssetSource(assetPath));
    } catch (e) {
      debugPrint('Error loading/playing asset: $e');
    }
  }

  Expanded buildKey({required Color color, required int soundNumber}) {
    return Expanded(

      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color, // Set the button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // No rounded corners
          ),
        ),
        onPressed: () {
          playSound(soundNumber);
        },
        child: const SizedBox.shrink(), // No text or child widget
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(title: Text('Xylophone app'),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(color: Colors.red, soundNumber: 1),
              buildKey(color: Colors.orange, soundNumber: 2),
              buildKey(color: Colors.yellow, soundNumber: 3),
              buildKey(color: Colors.green, soundNumber: 4),
              buildKey(color: Colors.teal, soundNumber: 5),
              buildKey(color: Colors.blue, soundNumber: 6),
              buildKey(color: Colors.purple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}


