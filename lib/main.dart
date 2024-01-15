// Author: Daniel McErlean
// Title: Main
// About: Main file for setting up all pages, routing, and themeData

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

import 'providers/data_provider.dart';
import 'screens/home_page.dart';
import 'screens/prompt_page.dart';
import 'screens/game_page.dart';
import 'screens/score_page.dart';
import 'screens/credits_page.dart';
import 'theme.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    ChangeNotifierProvider(
      child: const MainApp(),
      create: (context) {
        return DataProvider();
      },
    ),
  );

  FlutterNativeSplash.remove();
}

// remove scrolling glow effect since it would appear when you can't actually scroll
// https://stackoverflow.com/questions/51119795/how-to-remove-scroll-glow
class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // uses class to remove scrolling glow effect from entire application
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: MyScrollBehavior(),
          child: child!,
        );
      },

      // overall theme
      theme: theme(context),

      initialRoute: "/",
      routes: {
        // Main Page with Title, Play button, Highscore button, and Exit button
        "/": (context) => const HomePage(),

        // Prompt Page will prompt user for Username, Question Count, Category and Difficulty, and Start Game
        "/prompt": (context) => const PromptPage(),

        // Game Page will show Questions, Answers, Submit button, Next button, and a Game Over view
        "/game": (context) => const GamePage(),

        // Score Page will show top 10 highscores
        "/score": (context) => const ScorePage(),

        // Credits Page for documentation
        "/credits": (context) => const CreditsPage(),
      },
    );
  }
}
