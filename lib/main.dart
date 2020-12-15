import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'yomiage',
      theme: ThemeData(
        primarySwatch: hogepallete,
      ),
      home: MyHomePage(title: 'yomiage'),
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
  String msg = 'Type it in!';
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
                color: hogepallete,
                fontSize: 28,
              ),
            ),
            TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: hogepallete,
                    ),
                  ),
                ),
                style: TextStyle(
                  color: hogepallete,
                  fontSize: 28,
                ),
                controller: _speakText,
                onTap: () {
                  _speakText.text = "";
                  msg = "here...";
                }),
            SizedBox(
              width: 150,
              height: 50,
              child: FlatButton(
                child: Text(
                  "read",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                color: hogepallete,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onPressed: () {
                  setState(() {
                    msg = _speakText.text;
                    _speakText.text = "";
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

const MaterialColor hogepallete =
    MaterialColor(_hogepalletePrimaryValue, <int, Color>{
  50: Color(0xFFE8EAF6),
  100: Color(0xFFC5CAE9),
  200: Color(0xFF9FA8DA),
  300: Color(0xFF7986CB),
  400: Color(0xFF5C6BC0),
  500: Color(_hogepalletePrimaryValue),
  600: Color(0xFF3949AB),
  700: Color(0xFF303F9F),
  800: Color(0xFF283593),
  900: Color(0xFF1A237E),
});

const int _hogepalletePrimaryValue = 0xFF3F51B5;

const MaterialColor hogepalleteAccent =
    MaterialColor(_hogepalleteAccentValue, <int, Color>{
  100: Color(0xFF8C9EFF),
  200: Color(_hogepalleteAccentValue),
  400: Color(0xFF3D5AFE),
  700: Color(0xFF304FFE),
});

const int _hogepalleteAccentValue = 0xFF536DFE;
