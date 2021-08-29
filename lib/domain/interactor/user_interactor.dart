import 'dart:math';

import 'package:generator/data/congig/app_config.dart';
import 'package:generator/data/repository/users.dart';

class UserInteractor {
  static Future<String> getWinner() async {
    await Future.delayed(AppConfig.delayed); // Waiting for intrigue
    final random = Random();
    final users = usersRepository.users;
    final randomNumber = random.nextInt(users.length);
    return users[randomNumber];
  }

  static void addUser(String user) {
    usersRepository.addUser(user);
  }
}
