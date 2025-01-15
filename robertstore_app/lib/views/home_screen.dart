import 'package:flutter/material.dart';
import 'package:robertstore_app/controllers/user_controller.dart';
import 'package:robertstore_app/models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserController _userController = UserController();
  List<UserModel> _users = [];

  late TextEditingController name = TextEditingController();
  late TextEditingController email = TextEditingController();
  late String password = "";
  late int usertype = 1;

  // Future<void> _getUsers() async {
  //   setState(() async {
  //     _users = await _userController.getUsers();
  //   });
  // }
  Future<void> _getUsers() async {
    _users = await _userController.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _getUsers();
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('RobertStoreApp'),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shadowColor: Colors.cyanAccent,
            child: Row(
              children: [Text("usuario ${_users[index].username}")],
            ),
          );
        },
      ),
    );
  }
}
