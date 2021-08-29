import 'package:flutter/material.dart';
import 'package:generator/domain/interactor/user_interactor.dart';
import 'package:generator/presentation/core/strings/strings.dart';

Widget buildLeftSide({
  required bool isGeneratingWinner,
  required List<String> users,
  required VoidCallback setState,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        height: 200,
        width: 200,
        child: Image.asset(
          !isGeneratingWinner
              ? 'assets/cooking-static.jpg'
              : 'assets/cooking.gif',
        ),
      ),
      Spacer(),
      isGeneratingWinner
          ? FutureBuilder(
              future: UserInteractor.getWinner(),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Column(
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 8),
                        Text(Strings.searchWinner)
                      ],
                    );
                  case ConnectionState.done:
                    return Column(
                      children: [
                        Text(
                          Strings.winner,
                          style: TextStyle(color: Colors.green),
                        ),
                        Text(
                          '${snapshot.data}',
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    );
                  default:
                    return SizedBox();
                }
              },
            )
          : SizedBox(
              width: 200,
              height: 52,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.deepPurple,
                  ),
                ),
                onPressed: () {
                  if (users.isEmpty) return;
                  setState();
                },
                child: Text(
                  Strings.getWinner.toUpperCase(),
                ),
              ),
            ),
      SizedBox(height: 60),
    ],
  );
}
