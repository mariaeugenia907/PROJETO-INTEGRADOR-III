import 'package:bank_sirius/models/contatos.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bancosirius.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE favoritos('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)');
    }, version: 1,
      //onDowngrade: onDatabaseDowngradeDelete,
    );
  });
}

Future<int> save(Favoritos favoritos) {
  return createDatabase().then((db) {
    final Map<String, dynamic> favoritosMap = Map();
    favoritosMap['name'] = favoritos.nome;
    favoritosMap['account_number'] = favoritos.numerodaconta;
    return db.insert('favoritos', favoritosMap);
  });
}

Future<List<Favoritos>> findAll() {
  return createDatabase().then((db) {
    return db.query('favoritos').then((maps) {
      final List<Favoritos> contacts = [];
      for (Map<String, dynamic> map in maps) {
        final Favoritos favoritos = Favoritos(
          map['id'],
          map['name'],
          map['account_number'],
        );
        contacts.add(favoritos);
      }
      return contacts;
    });
  });
}