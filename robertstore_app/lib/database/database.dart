import 'package:mysql1/mysql1.dart';
//import 'package:path_provider/path_provider.dart';

class Database {
  static Future<MySqlConnection> connect() {
    // final Directory directory = await getTemporaryDirectory();
    // String dbPath = directory.path + '/database.db';

    var settings = ConnectionSettings(
      host: '10.0.2.2',
      port: 3306,
      user: 'robertstoreapp',
      password: 'storenicaragua',
      db: 'robertstoreappdb',
    );
    var conn = MySqlConnection.connect(settings);
    return conn;
  }

  static void createDatabase() async {
    final connection = await connect();
    await connection.query(
        'CREATE TABLE IF NOT EXISTS users (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(255), email VARCHAR(255), password VARCHAR(20), usertype int(10));');
  }
}
