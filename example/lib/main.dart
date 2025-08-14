import 'package:flutter/material.dart';
import 'package:joltax_inputs/flutter_inputs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        extensions: const [
          JoltaxInputTheme(
            backgroundColor: Colors.white,
            borderColor: Colors.grey,
            focusedBorderColor: Colors.blue,
            errorBorderColor: Colors.red,
            borderRadius: 8.0,
          ),
        ],
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Joltax Inputs Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            JoltaxOutlinedInput(
              label: 'Username',
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16),
            JoltaxOutlinedInput(
              label: 'Password',
              isPassword: true,
              keyboardType: TextInputType.text,
              obscureToggleText: (show: 'Show', hide: 'Hide'),
            ),
          ],
        ),
      ),
    );
  }
}
