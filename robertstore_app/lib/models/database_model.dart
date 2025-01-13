import 'package:mysql1/mysql1.dart';
import 'package:robertstore_app/models/user_model.dart';

class DatabaseModel {
  final MySqlConnection _connection;

  DatabaseModel({required MySqlConnection connection})
      : _connection = connection;

  Future<UserModel?> getUser(int id) async {
    try {
      var command =
          await _connection.query("SELECT * FROM users WHERE id = ?", [id]);
      //command.Parameters.AddWithValue("id", id);

      //var result = await command.execute;

      if (command.isNotEmpty) {
        return UserModel.fromRow(command);
      }
    } catch (e) {
      // Manejar error aquí
    }

    return null;
  }
}
