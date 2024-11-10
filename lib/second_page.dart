import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  final String data;

  // Constructor menerima data
  SecondPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Halaman Kedua')),
      body: Center(
        child:
            Text('Data yang diterima: $data', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
