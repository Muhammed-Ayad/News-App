import 'package:flutter/material.dart';

class SectionsPage extends StatelessWidget {
  const SectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.4,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Sections Page',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const Center(
        child: Text('Sections Page'),
      ),
    );
  }
}
