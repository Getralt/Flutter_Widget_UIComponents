import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  static const header = 'Snackbar Presentation';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: header,
      theme: ThemeData(
        primaryColor: const Color(0xffe19e1f), // changed from primarySwatch
        snackBarTheme: SnackBarThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      ),
      home: const MyHomePage(title: header),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: const Color(0xff1fe4d4), // cyan appbar
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Info button pressed!"),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
        ],
      ),
      body: const SnackBarDemo(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Floating Action Button Pressed!"),
              duration: Duration(seconds: 2),
            ),
          );
        },
        backgroundColor: const Color(0xff1460dc), // blue button
        child: const Icon(Icons.add),
      ),
    );
  }
}

class SnackBarDemo extends StatelessWidget {
  const SnackBarDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff9e12c8), // purple button
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          textStyle: const TextStyle(fontSize: 18),
        ),
        onPressed: () {
          final snackdemo = SnackBar(
            content: const Text('Hi! This is a custom SnackBar message.'),
            backgroundColor: const Color(0xffac1981), // pink snackbar
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.all(10),
            action: SnackBarAction(
              label: 'Undo',
              textColor: Colors.white,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Undo clicked")),
                );
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackdemo);
        },
        child: const Text('Click Me'),
      ),
    );
  }
}
