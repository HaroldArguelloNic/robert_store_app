//import 'package:mysql1/mysql1.dart';

class UserModel {
  final int id;
  final String username;
  final String password;

  UserModel({required this.id, required this.username, required this.password});

  factory UserModel.fromRow(result) {
    return UserModel(
      id: result['id'],
      username: result['username'],
      password: result['password'],
    );
  }
}
