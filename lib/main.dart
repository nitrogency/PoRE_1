import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Word Counter',
      home: WordCountForm(),
    );
  }
}

// Define a custom Form widget.
class WordCountForm extends StatefulWidget {
  const WordCountForm({super.key});

  @override
  State<WordCountForm> createState() => _WordCountFormState();
}

class _WordCountFormState extends State<WordCountForm> {
  final myController = TextEditingController();

  int wordCount = 0;
  int charCount = 0;

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  void calculateWordCount(){
    int words = myController.text.split(' ').where((words) => words.isNotEmpty).length;
    setState(() {
        wordCount = words;
    });
  }
  void calculateCharacterCount(){
    int char = myController.text.length;
    setState(() {
      charCount = char;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Word Counter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children:[
            TextField(
              controller: myController,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: (){
                  calculateWordCount();
                  calculateCharacterCount();
                },
                child: const Text('Calculate'),
              ),
            ),
            Text('Word Count: $wordCount'),
            Text('Character Count: $charCount'),
          ],
        ),
      ),
    );
  }
}
