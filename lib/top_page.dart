import 'package:flutter/material.dart';
import 'package:go_router_example/router/router.dart';

enum PageIndex { home, settings }

class TopPage extends StatefulWidget {
  const TopPage({required this.child, super.key});

  final Widget child;

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  BottomNavigationBar _bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: "Settings",
        ),
      ],
      onTap: (int index) {
        setState(() {
          _selectedIndex = index;
        });
        if (index == PageIndex.home.index) {
          const HomeRoute().go(context);
        } else if (index == PageIndex.settings.index) {
          const SettingsRoute().go(context);
        }
      },
    );
  }
}
