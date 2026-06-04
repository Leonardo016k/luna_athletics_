import 'package:e301_login/providers/sidemenu_provider.dart';
import 'package:e301_login/ui/shared/navbar.dart';
import 'package:e301_login/ui/shared/sidebar.dart';
import 'package:flutter/material.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;

  const DashboardLayout({super.key, required this.child});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SidemenuProvider.menuController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F11),
      body: Stack(
        children: [
          Row(
            children: [
              if (size.width >= 700) const Sidebar(),

              Expanded(
                child: Column(
                  children: [
                    const Navbar(),

                    Expanded(
                      child: Container(
                        color: const Color(0xFF0F0F11),
                        width: double.infinity,
                        height: double.infinity,
                        child: widget.child,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Menú lateral para pantallas móviles
          if (size.width < 700)
            AnimatedBuilder(
              animation: SidemenuProvider.menuController,
              builder: (context, _) => Stack(
                children: [
                  Transform.translate(
                    offset: Offset(SidemenuProvider.movement.value, 0),
                    child: const Sidebar(),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
