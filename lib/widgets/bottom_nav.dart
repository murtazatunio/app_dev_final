import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  static const _tabs = [
    {'icon': Icons.home, 'label': 'Home', 'route': '/home'},
    {'icon': Icons.credit_card, 'label': 'Cards', 'route': '/cards'},
    {'icon': Icons.pix, 'label': 'Pix', 'route': '/pix'},
    {'icon': Icons.note, 'label': 'Notes', 'route': '/notes'},
    {'icon': Icons.receipt_long, 'label': 'Extract', 'route': '/extract'},
  ];

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    for (int i = 0; i < _tabs.length; i++) {
      if (location == _tabs[i]['route']) return i;
    }
    return 0;
  }

  void _onTabTapped(BuildContext context, int index) {
    final location = GoRouterState.of(context).uri.toString();
    final route = _tabs[index]['route'] as String;
    if (location != route) {
      context.go(route);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getCurrentIndex(context);
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => _onTabTapped(context, index),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.grey,
      items: _tabs
          .map((tab) => BottomNavigationBarItem(
                icon: Icon(tab['icon'] as IconData),
                label: tab['label'] as String,
              ))
          .toList(),
    );
  }
}
