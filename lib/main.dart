import 'package:flutter/material.dart';
import 'package:perfectiontest/constants/routes.dart';
import 'package:perfectiontest/services/dio_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DioService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: appRoutes,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      initialRoute: initalRoute,
    );
  }
}
