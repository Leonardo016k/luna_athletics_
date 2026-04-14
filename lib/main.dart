import 'package:e301_login/providers/auth_provider.dart';
import 'package:e301_login/router/router.dart';
import 'package:e301_login/services/local_storage.dart';
import 'package:e301_login/services/navigation_service.dart';
import 'package:e301_login/ui/layouts/auth/auth_layout.dart';
import 'package:e301_login/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await LocalStorage.configPrefs();
  Flurorouter.configRoutes();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
      child: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      builder: (_, child) {
        //return AuthLayout(child: child!);
        return DashboardLayout(child: child!);
      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: WidgetStateProperty.all(Colors.amber.withAlpha(100)),
        ),
      ),
    );
  }
}
