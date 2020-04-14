import 'package:internet_bank/models/Pessoa.dart';
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

class PessoaDAO{

  static const tableName = 'pessoa';
  static const tablePessoa = 'CREATE TABLE pessoa(' +
        'id INTERGER PRIMARY KEY,' +
        'nome TEXT,' +
        'profissao TEXT)';

  Future<int> save(Pessoa pessoa) async {
  Database db = await createdatabase(tableName);

  final Map<String, dynamic> pessoaMap = Map();

  pessoaMap['id'] = pessoa.getId();
  pessoaMap['nome'] = pessoa.getNome();
  pessoaMap['profissao'] = pessoa.getProfissao();

  return db.insert(tableName, pessoaMap);
}

Future<List<Pessoa>> findAll() async {
  Database db = await createdatabase(tableName);

  List<Map<String, dynamic>> maps = await db.query(tableName);
  List<Pessoa> pessoas = List();

  for (Map<String, dynamic> map in maps) {
    pessoas.add(Pessoa(
      map['id'],
      map['nome'],
      map['profissao'],
    ));
  }

  return pessoas;
}

}