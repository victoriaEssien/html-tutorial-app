import 'package:flutter/material.dart';

class BasicStructureQuiz extends StatefulWidget {
  const BasicStructureQuiz({Key? key}) : super(key: key);

  @override
  State<BasicStructureQuiz> createState() => _BasicStructureQuizState();
}

class _BasicStructureQuizState extends State<BasicStructureQuiz> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  List<String> _userAnswers = []; // Store user's selected answers

  final List<Map<String, dynamic>> _quizData = [
    {
      "question": "What is the purpose of the <!DOCTYPE> declaration in HTML?",
      "options": [
        "To specify the document type and version of HTML being used",
        "To create a comment in the HTML code",
        "To define the structure of the web page",
        "To link external stylesheets"
      ],
      "correctAnswer": "To specify the document type and version of HTML being used"
    },
    {
      "question": "Which HTML element is considered the root element of an HTML document?",
      "options": [
        "<html>",
        "<body>",
        "<head>",
        "<div>"
      ],
      "correctAnswer": "<html>"
    },
    {
      "question": "What is the primary purpose of the <head> element in HTML?",
      "options": [
        "To define the main content of the web page",
        "To create a header at the top of the page",
        "To link external CSS and JavaScript files",
        "To display images and multimedia content"
      ],
      "correctAnswer": "To link external CSS and JavaScript files"
    },
    {
      "question": "Which HTML tag defines the main content area of a web page?",
      "options": [
        "<main>",
        "<article>",
        "<section>",
        "<body>"
      ],
      "correctAnswer": "<body>"
    },
    {
      "question": "What is the primary purpose of the HTML <title> tag?",
      "options": [
        "To define the structure of a web page",
        "To specify the background color of a web page",
        "To specify the title of a web page",
        "To define the main content area of a web page"
      ],
      "correctAnswer": "To specify the title of a web page"
    },
    {
      "question": "What is an important consideration when crafting titles with the <title> tag for web pages?",
      "options": [
        "Using as many keywords as possible to rank higher in search engines",
        "Keeping titles under 10 characters for clarity",
        "Ensuring titles are unique across all web pages",
        "Including complex technical terms for a niche audience"
      ],
      "correctAnswer": "Ensuring titles are unique across all web pages"
    }
  ];

  void _answerQuestion(String selectedOption) {
    _userAnswers.add(selectedOption); // Store user's selected answer

    if (selectedOption == _quizData[_currentQuestionIndex]['correctAnswer']) {
      setState(() {
        _score++;
      });
    }

    setState(() {
      if (_currentQuestionIndex < _quizData.length - 1) {
        _currentQuestionIndex++;
      } else {
        // Quiz completed, show results
        _showResultsDialog();
      }
    });
  }

  void _showResultsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quiz Results'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('You scored $_score out of ${_quizData.length}'),
                const SizedBox(height: 16),
                Text('Your Answers:'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _userAnswers.asMap().entries.map((entry) {
                    final int index = entry.key + 1;
                    final String userAnswer = entry.value;
                    final String correctAnswer =
                    _quizData[index - 1]['correctAnswer'];
                    return Text('\nQuestion $index: $userAnswer (Correct: $correctAnswer)');
                  }).toList(),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  _currentQuestionIndex = 0;
                  _score = 0;
                  _userAnswers.clear();
                });
              },
              child: const Text('Restart Quiz'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Structure Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${_currentQuestionIndex + 1}:',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              _quizData[_currentQuestionIndex]['question'],
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            ...(_quizData[_currentQuestionIndex]['options'] as List<String>)
                .map((option) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ElevatedButton(
                  onPressed: () => _answerQuestion(option),
                  child: Text(option),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
