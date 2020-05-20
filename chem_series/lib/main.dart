import 'package:chemseries/screens/series_card_details.dart';
import 'package:flutter/material.dart';
import 'package:chemseries/screens/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => Home(),
        '/cardDetails': (context) => CardDetails(),
      },
    );
  }
}
