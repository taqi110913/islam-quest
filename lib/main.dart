import 'package:flutter/material.dart';

void main() {
  runApp(const IslamicApp());
}

class IslamicApp extends StatelessWidget {
  const IslamicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islam Quest',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'NotoSans', // Use Noto fonts
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double xp = 40;
    double maxXp = 100;

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Assalamu alaikum!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LinearProgressIndicator(
                          value: xp / maxXp,
                          backgroundColor: Colors.grey[300],
                          color: Colors.green,
                          minHeight: 10,
                        ),
                        const SizedBox(height: 10),
                        Text('XP: ${xp.toInt()} / ${maxXp.toInt()}', style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LevelsPage()),
                        );
                      },
                      icon: const Icon(Icons.school, color: Colors.white),
                      label: const Text('Start Learning'),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const QuranLearningPage()),
                        );
                      },
                      icon: const Icon(Icons.menu_book, color: Colors.white),
                      label: const Text('Learn the Quran'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.menu, color: Colors.green),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}

class LevelsPage extends StatelessWidget {
  const LevelsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Curriculum'),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.star, color: Colors.orange),
              title: const Text('Pillars of Islam'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PillarsQuizPage()),
                );
              },
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const ListTile(
              leading: Icon(Icons.accessibility_new, color: Colors.blue),
              title: Text('How to Pray'),
            ),
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: const ListTile(
              leading: Icon(Icons.water_drop, color: Colors.teal),
              title: Text('Wudhu and Cleanliness'),
            ),
          ),
        ],
      ),
    );
  }
}

class PillarsQuizPage extends StatefulWidget {
  const PillarsQuizPage({super.key});

  @override
  State<PillarsQuizPage> createState() => _PillarsQuizPageState();
}

class _PillarsQuizPageState extends State<PillarsQuizPage> with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the first pillar of Islam?',
      'options': ['Salah', 'Shahadah', 'Zakat', 'Hajj'],
      'answer': 'Shahadah',
      'explanation': 'Shahadah is the declaration of faith, the first pillar of Islam.'
    },
    {
      'question': 'How many times do Muslims pray each day?',
      'options': ['3', '5', '7', '2'],
      'answer': '5',
      'explanation': 'Muslims pray five times a day as the second pillar, Salah.'
    },
  ];

  int _currentIndex = 0;
  int _correctCount = 0;
  int _incorrectCount = 0;
  String? _selectedAnswer;
  bool _answered = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _animation = Tween<double>(begin: 0.8, end: 1.2).chain(CurveTween(curve: Curves.elasticInOut)).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _nextQuestion() {
    setState(() {
      if (_selectedAnswer == _questions[_currentIndex]['answer']) {
        _correctCount++;
      } else {
        _incorrectCount++;
      }
      _answered = false;
      _selectedAnswer = null;
      if (_currentIndex < _questions.length - 1) {
        _currentIndex++;
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ResultPage(correct: _correctCount, incorrect: _incorrectCount),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = (_currentIndex + 1) / _questions.length;
    var question = _questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('Pillars of Islam')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(value: progress, color: Colors.green),
            const SizedBox(height: 10),
            Text('Question ${_currentIndex + 1} of ${_questions.length}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 20),
            Text(question['question'], style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Column(
              children: [
                for (var option in question['options'])
                  Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: ListTile(
                      title: Text(option),
                      tileColor: _answered && option == question['answer']
                          ? Colors.green[100]
                          : _answered && option == _selectedAnswer
                              ? Colors.red[100]
                              : null,
                      onTap: _answered
                          ? null
                          : () {
                              setState(() {
                                _selectedAnswer = option;
                                _answered = true;
                                _controller.forward(from: 0);
                              });
                            },
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 20),
            if (_answered) ...[
              ScaleTransition(
                scale: _animation,
                child: Text(
                  _selectedAnswer == question['answer'] ? '✅ Correct!' : '❌ Wrong!',
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              const SizedBox(height: 10),
              Text(question['explanation']),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _nextQuestion, child: const Text('Next')),
            ],
          ],
        ),
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final int correct;
  final int incorrect;
  const ResultPage({super.key, required this.correct, required this.incorrect});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Results')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('✅', style: TextStyle(fontSize: 80)),
            const SizedBox(height: 20),
            Text('Correct: $correct', style: const TextStyle(fontSize: 24)),
            Text('Incorrect: $incorrect', style: const TextStyle(fontSize: 24)),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Return to Learning'),
            ),
          ],
        ),
      ),
    );
  }
}

class QuranLearningPage extends StatelessWidget {
  const QuranLearningPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Learn the Quran')),
      body: const Center(child: Text('Coming Soon!')),
    );
  }
}
