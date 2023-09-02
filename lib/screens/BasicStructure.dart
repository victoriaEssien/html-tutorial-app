import 'package:flutter/material.dart';
import 'package:tutorial_app/screens/Basic_Structures/BodyLesson.dart';
import 'package:tutorial_app/screens/Basic_Structures/DoctypeLesson.dart';
import 'package:tutorial_app/screens/Basic_Structures/HeadLesson.dart';
import 'package:tutorial_app/screens/Basic_Structures/HtmlLesson.dart';
import 'package:tutorial_app/screens/Basic_Structures/TitleLesson.dart';

import 'Basic_Structures/BasicStructureQuiz.dart';

class BasicStructure extends StatefulWidget {
  const BasicStructure({Key? key}) : super(key: key);

  @override
  State<BasicStructure> createState() => _BasicStructureState();
}

class _BasicStructureState extends State<BasicStructure> {
  List<Map<String, dynamic>> htmlElements = [
    {'name': '<!DOCTYPE>', 'icon': Icons.code},
    {'name': '<html>', 'icon': Icons.code},
    {'name': '<head>', 'icon': Icons.code},
    {'name': '<title>', 'icon': Icons.code},
    {'name': '<body>', 'icon': Icons.code},
    {'name': 'Quiz', 'icon': Icons.quiz_rounded},
    // Add more HTML elements as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTML Basic Structure"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.all(16.0),
          ),
          SizedBox(height: 16.0),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              padding: EdgeInsets.all(16.0),
              children: htmlElements.map((element) {
                return _buildElementContainer(element['name'], element['icon']);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildElementContainer(String name, IconData icon) {
    return GestureDetector(
      onTap: () {
        _navigateToElementScreen(name); // Call a method to navigate to the desired screen
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40.0,
              color: Colors.white,
            ),
            SizedBox(height: 8.0),
            Flexible(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToElementScreen(String name) {
    // Implement the navigation logic based on the element name
    if (name == '<!DOCTYPE>') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DoctypeLesson(),
        ),
      );
    } else if (name == '<html>') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HtmlLesson(),
        ),
      );
    } else if (name == '<head>') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HeadLesson(),
        ),
      );
    } else if (name == '<title>') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TitleLesson(),
        )
      );
    } else if (name == '<body>') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BodyLesson(),
          )
      );
    } else if (name == 'Quiz') {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BasicStructureQuiz(),
          )
      );
    }
  }

}
