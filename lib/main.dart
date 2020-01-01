import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: Header(),
        body: Center(
          child: Text("テスト"),
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}
