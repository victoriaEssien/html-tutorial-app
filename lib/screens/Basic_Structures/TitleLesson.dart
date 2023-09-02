import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TitleLesson extends StatefulWidget {
  const TitleLesson({Key? key}) : super(key: key);

  @override
  State<TitleLesson> createState() => _TitleLessonState();
}

class _TitleLessonState extends State<TitleLesson> {
  List _items = [];

  @override
  void initState() {
    super.initState();
    readJson();
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/title.json');
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('<title> Lesson'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            // Display the data loaded from html.json
            _items.isNotEmpty
                ? Expanded(
              child: ListView.builder(
                itemCount: _items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_items[index]["name"]),
                    subtitle: Text(_items[index]["description"]),
                  );
                },
              ),
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}
