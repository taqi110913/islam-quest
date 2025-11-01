import 'package:flutter/material.dart';
double xp = 0;
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
        fontFamily: 'NotoSans',
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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, result) {
        // When a pop is invoked (e.g. system back), navigate to Home and
        // prevent the default automatic pop by disabling canPop above.
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Levels'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false,
              );
            },
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Level 1 - unchanged
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(Icons.looks_one, color: Colors.blue),
                title: const Text('Level 1'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LevelOne()),
                  );
                },
              ),
            ),
            // Level 2
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(Icons.looks_two, color: Colors.purple),
                title: const Text('Level 2'),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Level 2 coming soon!')),
                  );
                },
              ),
            ),
            // Level 3
            Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: Icon(Icons.looks_3, color: Colors.orange),
                title: const Text('Level 3'),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Level 3 coming soon!')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LevelOne extends StatelessWidget {
  const LevelOne({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, result) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const LevelsPage()),
          (route) => false,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Level 1'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LevelsPage()),
                (route) => false,
              );
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
                    MaterialPageRoute(builder: (context) => const PillarsReadingPage()),
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
      ),
    );
  }
}

class PillarsQuizPage extends StatefulWidget {
  const PillarsQuizPage({super.key});

  @override
  State<PillarsQuizPage> createState() => _PillarsQuizPageState();
}

class PillarsReadingPage extends StatelessWidget {
  const PillarsReadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pillars of Islam')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Pillars of Islam',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 16, color: Colors.black, height: 1.6),
                    children: [
                      TextSpan(
                        text: 'Welcome to your first lesson! Today, we will be learning about the Pillars of Islam.\n\n',
                      ),
                      TextSpan(
                        text: 'There are 5 Pillars of Islam:\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '• Shahadah',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ': The declaration of faith\n'),
                      TextSpan(
                        text: '• Salah',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ' (Prayer): Muslims pray 5 times a day\n'),
                      TextSpan(
                        text: '• Zakat',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ': Obligated charity\n'),
                      TextSpan(
                        text: '• Sawm',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ': Fasting in the month of Ramadan\n'),
                      TextSpan(
                        text: '• Hajj',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: ': Pilgrimage to the Holy House of Allah in Mecca\n'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PillarsQuizPage(),
                    ),
                  );
                },
                child: const Text('Start Quiz'),
              ),
            ),
          ],
        ),
      ),
    );
  }
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
  double _progress = 0.0;

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

  void _onAnswerSelected(String option) {
    setState(() {
      _selectedAnswer = option;
      _answered = true;
      _controller.forward(from: 0);
      _progress = (_currentIndex + 1) / _questions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    var question = _questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(title: const Text('Pillars of Islam')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            LinearProgressIndicator(value: _progress, color: Colors.green),
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
                      onTap: _answered ? null : () => _onAnswerSelected(option),
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
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: _selectedAnswer == question['answer'] ? Colors.green : Colors.red,
                  ),
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
    bool mostlyIncorrect = incorrect > correct;

    // Update XP based on correct answers
    xp += correct * 10;

    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Results')),
      body: Center(
        child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  mostlyIncorrect ? Icons.error : Icons.emoji_events,
                  color: mostlyIncorrect ? Colors.red : Colors.green,
                  size: 80,
                ),
                const SizedBox(height: 20),
                Text(
                  mostlyIncorrect
                      ? 'Keep going! Mistakes are a chance to learn.'
                      : 'Well done! You did great!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: mostlyIncorrect ? Colors.red : Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Text('You got $correct correct', style: const TextStyle(fontSize: 24)),
                Text('You got $incorrect incorrect', style: const TextStyle(fontSize: 24)),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const PillarsQuizPage()),
                    );
                  },
                  child: const Text('Try Again'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const LevelOne()),
                      (route) => false,
                    );
                  },
                  child: const Text('Return to Learning'),
                ),
              ],
            ),
          ),
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
