//import 'package:mysql1/mysql1.dart';

class UserModel {
  final int id;
  final String username;
  final String email;
  final String password;
  final int usertype;

  UserModel(
      {required this.id,
      required this.username,
      required this.email,
      required this.password,
      required this.usertype});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        id: map['id'],
        username: map['name'],
        email: map['email'],
        password: map['password'],
        usertype: map['usertyppe']);
  }
}
