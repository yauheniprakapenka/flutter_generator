import 'package:flutter/material.dart';

class UsersRepository extends ChangeNotifier {
  var users = <String>[];

  void addUser(String user) {
    users.add(user);
    notifyListeners();
  }
}

final usersRepository = UsersRepository();
