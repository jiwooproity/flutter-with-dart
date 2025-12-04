import 'dart:async';

import 'package:flutter/material.dart';

class StopWatchScreen extends StatefulWidget {
  const StopWatchScreen({super.key});

  @override
  State<StopWatchScreen> createState() => _StopWatchScreenState();
}

class _StopWatchScreenState extends State<StopWatchScreen> {
  Timer? _timer;

  int _time = 0;

  bool _isRunning = false;

  final List<String> _lapTimes = [];

  void _handleTimer() {
    _isRunning = !_isRunning;

    if (_isRunning) {
      _play();
    } else {
      _pause();
    }
  }

  void _play() {
    _timer = Timer.periodic(const Duration(milliseconds: 10), (time) {
      setState(() {
        _time++;
      });
    });
  }

  void _pause() {
    _timer?.cancel();
  }

  void _reset() {
    _isRunning = false;
    _timer?.cancel();
    _time = 0;
    _lapTimes.clear();
  }

  void record(String minute, String second, String ms) {
    _lapTimes.insert(0, '$minute:$second.$ms');
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String second = ((_time ~/ 100) % 60).toString().padLeft(2, "0");
    String minute = ((_time ~/ 100) / 60).floor().toString().padLeft(2, '0');
    String ms = '${_time % 100}'.padLeft(2, '0');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stop Watch'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  minute,
                  style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    height: 0.2,
                    fontSize: 80,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  ':',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    height: 0.2,
                    fontSize: 80,
                    color: Colors.white,
                  ),
                ),
                Text(
                  second,
                  style: const TextStyle(
                    fontWeight: FontWeight.w200,
                    height: 0.2,
                    fontSize: 80,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  '.',
                  style: TextStyle(
                    fontWeight: FontWeight.w200,
                    height: 0.2,
                    fontSize: 80,
                    color: Colors.white,
                  ),
                ),
                Text(
                  ms,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              height: 100,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.5,color: Color.fromRGBO(255, 255, 255, 0.2))
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton.large(
                      onPressed: () {
                        setState(() {
                          _isRunning ? record(minute, second, ms) : _reset();
                        });
                      },
                      backgroundColor: Color.fromRGBO(57, 57, 57, 1),
                      child: Text(
                        _isRunning ? "랩" : "재설정",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    FloatingActionButton.large(
                      onPressed: () {
                        setState(() {
                          _handleTimer();
                        });
                      },
                      backgroundColor: _isRunning
                          ? Color.fromRGBO(215, 73, 73, 0.5)
                          : Color.fromRGBO(48, 119, 53, 0.5),
                      child: Text(
                        _isRunning ? "중단" : "시작",
                        style: TextStyle(
                          color: _isRunning
                              ? Color.fromRGBO(255, 36, 36, 0.8)
                              : Color.fromRGBO(102, 236, 111, 0.8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 300,
              color: Colors.black,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 15,
                        left: 15,
                        right: 15,
                      ),
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: _lapTimes.length,
                        itemBuilder: (BuildContext ctx, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '랩 ${_lapTimes.length - index}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                _lapTimes[index],
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext ctx, int index) {
                          return Divider(
                            height: 12,
                            color: Color.fromRGBO(255, 255, 255, 0.4),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
