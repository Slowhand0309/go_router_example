import 'package:flutter/material.dart';
import 'package:go_router_example/router/router.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => const ColorPickerDialogRoute().push(context),
            child: const Text('Show Color Picker Dialog')),
      ),
    );
  }
}
