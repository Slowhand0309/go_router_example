import 'package:flutter/material.dart';

class ColorPickerDialog extends StatelessWidget {
  const ColorPickerDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ColorPickerDialog')),
      body: Container(
        color: Colors.deepPurple.shade300,
        child: const Center(
          child: Text('ColorPickerDialog'),
        ),
      ),
    );
  }
}
