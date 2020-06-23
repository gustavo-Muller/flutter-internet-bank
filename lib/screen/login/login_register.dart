import 'package:flutter/material.dart';
import 'package:internet_bank/services/auth.dart';

class LoginRegister extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisterState();
}

class _RegisterState extends State<LoginRegister> {
  var _usuarioController = TextEditingController();
  var _senhaController = TextEditingController();
  AuthService _auth = AuthService();
  String error = "";
  var _isSecured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(96, 120, 235, 1),
        child: ListView(
          children: <Widget>[
            //Usuário
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 20, right: 40),
              child: TextFormField(
                controller: _usuarioController,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "Usuário",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            //Senha
            Padding(
              padding: const EdgeInsets.only(
                  left: 40, top: 10, right: 40, bottom: 20),
              child: TextFormField(
                controller: _senhaController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Senha",
                    prefixIcon: Icon(Icons.https),
                    suffixIcon: IconButton(
                      onPressed: () => _exibaSenha(),
                      icon: Icon(
                          _isSecured ? Icons.visibility_off : Icons.visibility),
                    )),
                obscureText: _isSecured,
              ),
            ),

            //Botão "Criar Conta"
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: RaisedButton(
                onPressed: () async {
                  dynamic resultado;
                  String usuario = _usuarioController.text;
                  String senha = _senhaController.text;
                  if(_usuarioController != null && _senhaController != null){
                    resultado = await _auth.registerWithEmailAndPassword(usuario, senha);
                  }
                  
                  //Navigator.pop(context);
                  
                  
                  if (resultado == null) {
                    setState(() => error = "Erro ao cadastrar, verifique seus dados");
                  }
                  
                },
                color: Color.fromRGBO(25, 8, 42, 0.8),
                splashColor: Color.fromRGBO(85, 175, 246, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Criar Conta",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Center(child: Text(error ,style: TextStyle(fontSize: 16.0, color: Colors.white),),),
          ],
        ),
      ),
    );
  }


  _exibaSenha() {
    setState(() {
      _isSecured = !_isSecured;
    });
  }
}
