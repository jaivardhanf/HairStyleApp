import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './result.dart';

void main() {
  runApp(NewApp());
}

class NewApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewAppState();
  }
}

class NewAppState extends State<NewApp> {
  final questions = const [
    {
      'questionText': 'What is your hair type?',
      'answers': ['Smooth', 'Curly', 'Dry', 'Braided'],
    },
    {
      'questionText': 'What is your hair color?',
      'answers': ['Black', 'Brown', 'Grey', 'Other'],
    },
    {
      'questionText': 'What is your hair stlye?',
      'answers': ['Parted', 'Mohawk', 'Fringe', 'Undercut'],
    },
  ];
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex += 1;
    });
    print(questionIndex);
    if (questionIndex < questions.length) {
      print('More questions left!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Zenoti App'),
        ),
        body: questionIndex < questions.length
            ? Column(
                children: [
                  Question(
                    questions[questionIndex]['questionText'] as String,
                  ),
                  ...(questions[questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    return Answer(answerQuestion, answer);
                  }).toList()
                ],
              )
            : Center(
                child: Text('Thank you for taking the survey!'),
              ),
      ),
    );
  }
}
