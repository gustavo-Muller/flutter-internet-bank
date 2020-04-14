import 'package:flutter/material.dart';
import 'package:internet_bank/screen/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _usuarioController = TextEditingController();
  var _senhaController = TextEditingController();
  var _isSecured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(96, 120, 235, 1),
        child: ListView(
          children: <Widget>[
            // WavyImage(
            //   image: "assets/logo_ibt.png",
            // ),
            Image(image: AssetImage("assets/logo_ibt.png"),),
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
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: RaisedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())),
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
            )
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
