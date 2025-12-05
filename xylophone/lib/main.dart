import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone App',
      theme: ThemeData(useMaterial3: false),
      home: const Xylophone(),
    );
  }
}

class Xylophone extends StatefulWidget {
  const Xylophone({super.key});

  @override
  State<Xylophone> createState() => _XylophoneState();
}

class _XylophoneState extends State<Xylophone> {
  final List<AudioPlayer> _audioPlayers = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    initAudioPlayers();
  }

  @override
  void dispose() {
    for (final player in _audioPlayers) {
      player.dispose();
    }
    super.dispose();
  }

  Future<void> initAudioPlayers() async {
    final List<String> notes = [
      "do1.wav",
      "re.wav",
      "mi.wav",
      "fa.wav",
      "sol.wav",
      "la.wav",
      "si.wav",
      "do2.wav",
    ];

    for (final note in notes) {
      final player = AudioPlayer();
      try {
        await player.setAsset('assets/$note');
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
      _audioPlayers.add(player);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return Scaffold(
      appBar: AppBar(title: const Text("Xylophone App")),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: gunban('도', Colors.red, index: 0),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: gunban('레', Colors.orange, index: 1),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32),
                  child: gunban('미', Colors.deepOrangeAccent, index: 2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: gunban('파', Colors.cyan, index: 3),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 48),
                  child: gunban('솔', Colors.blue, index: 4),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 56),
                  child: gunban('라', Colors.purple, index: 5),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 64),
                  child: gunban('시', Colors.pink, index: 6),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 72),
                  child: gunban('도', Colors.pinkAccent, index: 7),
                ),
              ],
            ),
    );
  }

  Widget gunban(String text, Color color, {required int index}) {
    return GestureDetector(
      onTap: () {
        print(_audioPlayers);
        if (index < _audioPlayers.length) {
          _audioPlayers[index].seek(Duration.zero);
          _audioPlayers[index].play();
        }
      },
      child: Container(
        width: 50,
        height: double.infinity,
        color: color,
        child: Center(
          child: Text(text, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
