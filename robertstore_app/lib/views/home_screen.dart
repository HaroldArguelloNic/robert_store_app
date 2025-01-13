import 'package:flutter/material.dart';
import 'package:robertstore_app/controllers/user_controller.dart';
import 'package:robertstore_app/models/user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserController _userController = UserController();

  List<User> _users = [];
  late String name = "";
  late String email = "";

  Future<void> _getUsers() async {
    setState(() async {
      _users = await _userController.getUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RobertStore App'),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_users[index].name),
            subtitle: Text(_users[index].email),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog<String>(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Add User'),
              content: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancelar'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: Text('Agregar'),
                  onPressed: () async {
                    await showDialog<String>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Add Email'),
                        content: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Cancelar'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: Text('Agregar'),
                            onPressed: () async {
                              await _userController.addUser(name, email);
                              _getUsers();
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      ),
                    );
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );

          _getUsers();
        },
      ),
    );
  }
}
