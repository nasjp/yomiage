import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Voice Over',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Voice Over'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String msg = 'ここ';
  var _speakText = TextEditingController();

  FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    initTts();
  }

  void initTts() {
    flutterTts = FlutterTts();
    flutterTts.setLanguage('ja-Jp');
  }

  _speak(msg) {
    flutterTts.speak(msg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              msg,
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.90,
            ),
            TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                ),
                controller: _speakText,
                onTap: () {
                  _speakText.text = "";
                  msg = "ここに話す内容が出るよ";
                }),
            SizedBox(
              width: 250,
              height: 50,
              child: FlatButton(
                child: Text(
                  "押すとしゃべるよ",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onPressed: () {
                  setState(() {
                    msg = _speakText.text;
                    _speak(msg);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
