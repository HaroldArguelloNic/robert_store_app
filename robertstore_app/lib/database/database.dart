import 'package:mysql1/mysql1.dart';
//import 'package:path_provider/path_provider.dart';

class Database {
  static Future<MySqlConnection> connect() async {
    // final Directory directory = await getTemporaryDirectory();
    // String dbPath = directory.path + '/database.db';

    final connection = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'your_username',
      password: 'your_password',
      db: 'your_database',
    ));

    return connection;
  }

  static Future<void> createDatabase() async {
    final connection = await connect();
    await connection.query(
        'CREATE TABLE IF NOT EXISTS users (id INT PRIMARY KEY, name VARCHAR(255), email VARCHAR(255));');
  }
}
