import 'package:flutter/material.dart';

void main() {
  runApp(const PredictionApp());
}

class PredictionApp extends StatelessWidget {
  const PredictionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prediction App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            fontSize: 20,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      home: const PredictionScreen(),
    );
  }
}

class PredictionScreen extends StatefulWidget {
  const PredictionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PredictionScreenState createState() => _PredictionScreenState();
}

class _PredictionScreenState extends State<PredictionScreen> {
  final TextEditingController _inputController = TextEditingController();
  String _prediction = '';

  final predictions = [
    'Your future is full of endless possibilities.',
    'You will experience a positive turning point in your life soon.',
    'You will discover a hidden talent that will lead to new opportunities.',
    'Unexpected good fortune is on its way to you.',
    'You will find peace and balance in your life.',
    'Your hard work and dedication will be rewarded.',
    'Exciting adventures and new experiences are ahead for you.',
    'You will meet someone special who will positively impact your life.',
    'Your creativity and imagination will flourish in the coming year.',
    'You are on the verge of achieving your long-held dreams.',
  ];

  void _makePrediction() {
    final random = predictions[DateTime.now().millisecond % predictions.length];

    setState(() {
      _prediction = random;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction App',
            style: Theme.of(context).textTheme.headlineLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _inputController,
              style: Theme.of(context).textTheme.bodyLarge,
              decoration: const InputDecoration(
                labelText: 'Enter your question',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _makePrediction,
              style: ElevatedButton.styleFrom(
                // primary: Colors.red,
                // onPrimary: Colors.white,
                padding: const EdgeInsets.all(12.0),
                textStyle: Theme.of(context).textTheme.bodyLarge,
              ),
              child: const Text('Predict'),
            ),
            const SizedBox(height: 20),
            Text(
              'Prediction:',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 10),
            Text(
              _prediction,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
