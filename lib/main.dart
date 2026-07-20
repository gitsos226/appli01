import 'package:flutter/material.dart';
import 'package:appli01/pages/communautes.dart';

void main() {
  runApp(
    const MaterialApp(debugShowCheckedModeBanner: false, home: MainPage()),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CommunautesPage()),
            );
          },
          child: Text('Go to Communautes Page'),
        ),
      ),
    );
  }
}
