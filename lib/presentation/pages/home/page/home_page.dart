import 'package:flutter/material.dart';
import 'package:generator/data/repository/users.dart';
import 'package:generator/presentation/pages/home/components/left_side/left_side.dart';
import 'package:generator/presentation/pages/home/components/right_side/right_side.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var isGeneratingWinner = false;
  final controller = TextEditingController();
  var users = <String>[];

  @override
  void initState() {
    super.initState();
    usersRepository.addListener(() {
      users = usersRepository.users;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFfef2e6),
      body: Row(
        children: [
          SizedBox(width: 60),
          buildLeftSide(
              isGeneratingWinner: isGeneratingWinner,
              users: users,
              setState: () {
                setState(() {
                  isGeneratingWinner = !isGeneratingWinner;
                });
              }),
          SizedBox(width: 60),
          buildRightSide(controller: controller, users: users),
        ],
      ),
    );
  }
}
