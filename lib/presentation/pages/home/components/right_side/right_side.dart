import 'package:flutter/material.dart';
import 'package:generator/domain/interactor/user_interactor.dart';
import 'package:generator/presentation/core/strings/strings.dart';

Widget buildRightSide({
  required List<String> users,
  required TextEditingController controller,
}) {
  return Column(
    children: [
      SizedBox(height: 60),
      Text('${Strings.users} (${users.length})'),
      SizedBox(height: 20),
      Expanded(
        child: SizedBox(
          width: 200,
          height: 200,
          child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 16),
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.amber[200],
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Center(
                    child: Text(
                      users[index],
                    ),
                  ),
                );
              }),
        ),
      ),
      SizedBox(
        width: 300,
        height: 60,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            fillColor: Colors.white,
            filled: true,
          ),
        ),
      ),
      TextButton(
        onPressed: () {
          if (controller.text.isEmpty) return;
          final user = controller.text;
          UserInteractor.addUser(user);
          controller.clear();
        },
        child: Text(Strings.addUser),
      ),
      SizedBox(height: 24),
    ],
  );
}
