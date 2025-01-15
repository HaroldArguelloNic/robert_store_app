//import 'package:flutter/material.dart';
import 'package:robertstore_app/database/database.dart';
import 'package:robertstore_app/models/user_model.dart';

class UserController {
  final Database database = Database();

  Future<List<UserModel>> getUsers() async {
    Database.createDatabase();
    final connection = await Database.connect();
    List<UserModel> users = [];

    final rows = await connection.query('SELECT * FROM users');
    for (var row in rows) {
      var user = UserModel(
        id: row[0],
        username: row[1],
        email: row[2],
        password: row[3],
        usertype: row[4],
      );
      users.add(user);
    }
    return users;
  }

  addUser(String name, String email, String password, int usertype) async {
    Database.createDatabase();
    final connection = await Database.connect();

    connection.query(
        'INSERT INTO users (name, email, password, usertype) VALUES (?, ?, ?, ?)',
        [name, email, password, usertype]);
  }
}
