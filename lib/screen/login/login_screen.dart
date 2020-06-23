import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:internet_bank/screen/home/home_screen.dart';
import 'package:internet_bank/screen/login/login_register.dart';
//import 'package:internet_bank/services/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _usuarioController = TextEditingController();
  var _senhaController = TextEditingController();
  var _isSecured = true;
  //var _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(96, 120, 235, 1),
        child: ListView(
          children: <Widget>[
            Image(
              image: AssetImage("assets/logo_ibt.png"),
            ),
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
            //Botão "Entrar"
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: RaisedButton(
                onPressed: logar,
                color: Color.fromRGBO(25, 8, 42, 0.8),
                splashColor: Color.fromRGBO(85, 175, 246, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Entrar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            //Botão "Crie sua conta"
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: RaisedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginRegister())),
                color: Color.fromRGBO(25, 8, 42, 0.8),
                splashColor: Color.fromRGBO(85, 175, 246, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Crie sua conta",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
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

  Future<void> logar() async {
    if (_usuarioController.value != null && _senhaController != null) {
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(email: _usuarioController.text, password: _senhaController.text,
        );
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } catch (e) {
        return null;
      }
    }
  }
}
