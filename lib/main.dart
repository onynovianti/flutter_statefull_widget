import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //variabel berubah
  double _inputUser = 0;
  double _kelvin = 150;
  double _reamur = 200;
  TextEditingController textController = new TextEditingController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen
      _inputUser = double.parse(textController.text);
      _kelvin = _inputUser + 273;
      _reamur = 4 * _inputUser / 5;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              Input(textController: textController),
              Result(kelvin: _kelvin, reamur: _reamur),
              Convert()
            ],
          ),
        ),
      ),
    );
  }

  Container Convert() {
    return Container(
      margin: EdgeInsets.only(top: 150),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(40),
          primary: Colors.blue, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: _incrementCounter,
        child: Text('Konversi Suhu'),
      ),
    );
  }
}

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required double kelvin,
    required double reamur,
  })  : _kelvin = kelvin,
        _reamur = reamur,
        super(key: key);

  final double _kelvin;
  final double _reamur;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 150),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 3, color: Colors.orangeAccent)),
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "Suhu dalam Kelvin",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  child: Text(
                    "$_kelvin",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 57),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 3, color: Colors.orangeAccent)),
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Suhu dalam Reamor",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  child: Text(
                    "$_reamur",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Input extends StatelessWidget {
  const Input({
    Key? key,
    required this.textController,
  }) : super(key: key);

  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: new InputDecoration(hintText: "Masukkan Suhu Dalam Celcius"),
      controller: textController,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
