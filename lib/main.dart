import 'package:disenos/src/pages/headers_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(DisenosApp());


class DisenosApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños app',
      home: HeadersPage(),
      routes: {
        'headers' : (_) => HeadersPage(),
      },
    );
  }
}
