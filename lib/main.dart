import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Welcome!"),
        backgroundColor: Colors.blue,
      ),
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var name = " ";
  TextEditingController nameValue = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: AutoSizeText(
              "Enter your name down here:",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..color = Colors.blue),
              maxLines: 1,
            ),
          ),
          SizedBox(
            width: 300,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.white.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 3))
                  ]),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  onChanged: (text) {
                    setState(() {
                      name = nameValue.text;
                    });
                  },
                  controller: nameValue,
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                  inputFormatters: [LengthLimitingTextInputFormatter(20)],
                  decoration:
                      new InputDecoration.collapsed(hintText: "Your name."),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Hello $name !",
                ),
              ))
        ],
      ),
    );
  }
}
