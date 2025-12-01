import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int count = 0;

  // String _text = '';
  // final 상수 타입의 경우 생략이 가능 -  TextEditingController _textController = new TextEditingController();
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            // 정렬 방법, MainAxisAlignment 속성의 center 사용
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(width: 100, height: 100, color: Colors.red),
              SizedBox(height: 100),
              Text('숫자', style: TextStyle(color: Colors.green, fontSize: 20)),
              Text(
                '$count',
                style: TextStyle(color: Colors.green, fontSize: 50),
              ),
              ElevatedButton(
                onPressed: () {
                  print("ElevatedButton");
                },
                child: Text('ElevatedButton'),
              ),
              TextButton(
                onPressed: () {
                  print("TextButton");
                },
                child: Text('TextButton'),
              ),
              OutlinedButton(
                onPressed: () {
                  print("OutlinedButton");
                },
                child: Text('OutlinedButton'),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        labelText: '글자',
                        border: OutlineInputBorder(),
                      ),
                      // onChanged: (text) {
                      //   _text = text;
                      // },
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        print(_textController.text);
                        setState(() {});
                      },
                      child: Text('Login'),
                    ),
                  ),
                ],
              ),
              Text(_textController.text),
              Image.network(
                'https://i.namu.wiki/i/DrWaPwgxFdI3ZCXXcnqqXzp27xNV_v3xnLFvgUyT2SlGJSwOr2ESuDG_jUdXUm1BGuGSDj2lLfpV8kNIRPg4lA.webp',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
              Container(
                color: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Image.asset(
                    'assets/paust.webp',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              count++;
              setState(() {
                count;
              });
            },
            backgroundColor: Colors.black,
            child: Icon(Icons.add),
          ),
          SizedBox(width: 5),
          FloatingActionButton(
            onPressed: () {
              count--;
              setState(() {
                count;
              });
            },
            backgroundColor: Colors.black,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
