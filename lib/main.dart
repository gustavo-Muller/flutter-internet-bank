import 'package:flutter/material.dart';
// import 'package:internet_bank/database/dao/pessoa_dao.dart';
// import 'package:internet_bank/models/Pessoa.dart';
import 'package:internet_bank/screen/login/login_screen.dart';
import 'package:internet_bank/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:internet_bank/models/user.dart';

void main() {
  runApp(MyApp());

  // PessoaDAO _pessoaDAO = PessoaDAO();

  // _pessoaDAO.save(Pessoa(0, "Teste 0", "Tester 0"));
  // _pessoaDAO.save(Pessoa(1, "Teste 1", "Tester 1")).then((id) {
  //   _pessoaDAO.findAll().then((pessoas) => debugPrint(pessoas.toString()));
  // });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
//      title: 'Flutter Demo',
//      theme: ThemeData(primarySwatch: Colors.blue),
      child: MaterialApp(
        home: LoginScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
