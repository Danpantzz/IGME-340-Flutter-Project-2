// Author: Daniel McErlean
// Title: Score Page
// About: Displays each users score (how many questions they got correct overall).
//        Score will update as users get more questions correct under the same username.
//        Scores are reset when the user exits the app.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data_provider.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  @override
  Widget build(BuildContext context) {
    var users = context.read<DataProvider>().users;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Highscores"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: users.isEmpty
          // if no users yet, then don't attempt to display any
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No users yet!",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                )
          // is users list is not empty, display users and their scores
              : GridView.builder(
                  physics: const ScrollPhysics(),
                  itemCount: users.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 10,
                    childAspectRatio: 3,
                  ),
                  itemBuilder: ((context, index) {
                    return GridTile(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${users[index].values.elementAt(0)}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text(
                              'Score: ${users[index].values.elementAt(1)}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
        ),
      ),
    );
  }
}
