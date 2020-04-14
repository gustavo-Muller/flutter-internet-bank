import 'package:internet_bank/models/Transferencia.dart';
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

class TransferenciaDAO {

  static const tableName = 'transferencia';
  static const createTable = 'CREATE TABLE $tableName(' +
      'id INTERGER PRIMARY KEY,' +
      'contaDestino TEXT,' +
      'contaMandante TEXT,' +
      'valor TEXT)';

  Future<int> save(Transferencia transferencia) async {
    Database db = await createdatabase(createTable);

    final Map<String, dynamic> transferenciaMap = Map();
    var transferencias = await findAll();

    transferenciaMap['id'] = transferencias.length + 1;
    transferenciaMap['contaDestino'] = transferencia.getContaDestino();
    transferenciaMap['contaMandante'] = transferencia.getContaMandante();
    transferenciaMap['valor'] = transferencia.getValor();

    return db.insert(tableName, transferenciaMap);
  }

  Future<List<Transferencia>> findAll() async {
    Database db = await createdatabase(createTable);

    List<Map<String, dynamic>> maps = await db.query(tableName);
    List<Transferencia> transferencias = List();

    for (Map<String, dynamic> map in maps) {
      transferencias.add(Transferencia(
        map['id'],
        map['contaDestino'],
        map['contaMandante'],
        map['valor'],
      ));
    }

    return transferencias;
  }
}
