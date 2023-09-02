import 'package:flutter/material.dart';

class TextFormatting extends StatefulWidget {
  const TextFormatting({Key? key}) : super(key: key);

  @override
  State<TextFormatting> createState() => _TextFormattingState();
}

class _TextFormattingState extends State<TextFormatting> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Text Formatting"),

    );
  }
}
