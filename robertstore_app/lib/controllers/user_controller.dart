//import 'package:flutter/material.dart';
import 'package:robertstore_app/database/database.dart';
import 'package:robertstore_app/models/user_model.dart';

class UserController {
  final Database database = Database();

  Future<List<UserModel>> getUsers() async {
    await Database.createDatabase();
    final connection = await Database.connect();
    List<UserModel> users = [];

    final rows = await connection.query('SELECT * FROM users');
    for (var row in rows) {
      users.add(UserModel.fromMap(row as Map<String, dynamic>));
    }

    return users;
  }

  Future<void> addUser(String name, String email) async {
    await Database.createDatabase();
    final connection = await Database.connect();

    await connection
        .query('INSERT INTO users (name, email) VALUES (?, ?)', [name, email]);
  }
}
