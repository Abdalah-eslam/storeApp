import 'package:flutter/material.dart';
import 'package:started/page/Homepage.dart';
import 'package:started/page/Updateproduct.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Homepage.id: (context) => const Homepage(),
        Updateproductpage.id: (context) => Updateproductpage(),
      },
      initialRoute: Homepage.id,
    );
  }
}
