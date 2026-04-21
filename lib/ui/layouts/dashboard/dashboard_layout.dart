import 'package:e301_login/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;

  const DashboardLayout({
    super.key, required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Row(
        children: [
          //TODO: Si es mas de 700px
          Sidebar(),
          Expanded(child: child)
        ],
      ),
    );
  }
}
