import 'package:budgeit/constants/app_themes.dart';
import 'package:budgeit/ui/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeSwitch(),
      builder: (context, _) {
        final themeSwitch = Provider.of<ThemeSwitch>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeSwitch.themeMode,
          theme: BudgeitThemes.lightTheme,
          darkTheme: BudgeitThemes.darkTheme,
          home: const SplashScreen(),
        );
      },
    );
  }
}
