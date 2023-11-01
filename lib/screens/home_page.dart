import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return quitButtonPressed(context);
      },
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text("Home"),
        // ),
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/Background22.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: AnimatedTextKit(
                      isRepeatingAnimation: true,
                      repeatForever: true,
                      animatedTexts: [
                        WavyAnimatedText(
                          "Trivia Time!",
                          textStyle: Theme.of(context).textTheme.titleLarge!,
                          speed: const Duration(milliseconds: 200),
                          textAlign: TextAlign.center,
                          // colors: [
                          //   Colors.black,
                          //   Color(0xFF2F0068),
                          // ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height / 20,
                  ),
                  // Start Game Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/prompt");
                    },
                    child: const Text("Start Game"),
                  ),

                  // Highscore Page Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/score");
                    },
                    child: const Text("Highscores"),
                  ),

                  // Quit Game Button
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: ElevatedButton(
                      onPressed: () {
                        quitButtonPressed(context);
                      },
                      child: const Text("Quit Game"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  quitButtonPressed(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Are you sure you want to quit?",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(
                      Size(
                        MediaQuery.of(context).size.width / 5,
                        MediaQuery.of(context).size.height / 20,
                      ),
                    ),
                  ),
                  child: const Text("No"),
                ),
                ElevatedButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStatePropertyAll(
                      Size(
                        MediaQuery.of(context).size.width / 5,
                        MediaQuery.of(context).size.height / 20,
                      ),
                    ),
                  ),
                  child: const Text("Yes"),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
