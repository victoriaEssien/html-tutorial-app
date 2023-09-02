import 'package:flutter/material.dart';
import 'package:tutorial_app/screens/BasicStructure.dart';
import 'package:tutorial_app/screens/LinksNavigation.dart';
import 'package:tutorial_app/screens/TextFormatting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> htmlElements = [
    {'name': 'Basic Structure', 'icon': Icons.code},
    {'name': 'Text Formatting', 'icon': Icons.text_format},
    {'name': 'Links and Navigation', 'icon': Icons.link},
    {'name': 'Forms and Input', 'icon': Icons.input},
    {'name': 'Semantic Elements', 'icon': Icons.view_headline},
    {'name': 'Metadata and Document Structure', 'icon': Icons.insert_drive_file},
    {'name': 'Multimedia', 'icon': Icons.image},
    {'name': 'Lists', 'icon': Icons.list_alt_rounded},
    {'name': 'Tables', 'icon': Icons.table_chart},
    {'name': 'Semantic Markup', 'icon': Icons.article},
    {'name': 'Embedded Content', 'icon': Icons.code_off_rounded},
    {'name': 'Miscellaneous', 'icon': Icons.format_quote},

    // Add more HTML elements as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.0),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Welcome",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
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
    if (name == 'Basic Structure') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BasicStructure(),
        ),
      );
    } else if (name == 'Text Formatting') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TextFormatting(),
        ),
      );
    } else if (name == 'Links and Navigation') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LinksNavigation(),
        ),
      );
    }
    // Add more conditions for other elements/screens
  }

}
