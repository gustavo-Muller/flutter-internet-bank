import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:internet_bank/database/dao/transferencia_dao.dart';
import 'package:internet_bank/models/Transferencia.dart';

class TransferenciaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final _cardSize = _screenSize.width - 30;

    final transferenciaDAO = TransferenciaDAO();

    final _contaController = TextEditingController();
    final _valorController = MoneyMaskedTextController(
        decimalSeparator: ',', thousandSeparator: '.');

    return Scaffold(
      backgroundColor: Color.fromRGBO(85, 175, 246, 1),
      body: Padding(
        padding:
            EdgeInsets.only(left: 8.0, right: 8.0, top: 80.0, bottom: 16.0),
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Container(
              width: _cardSize,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: ListView(
                  children: <Widget>[
                    buildTitle("Transferência"),
                    TextFormTransferencia(
                        contaController: _contaController,
                        hintText: "Conta",
                        icon: Icons.account_balance),
                    TextFormTransferencia(
                        contaController: _valorController,
                        hintText: "",
                        icon: Icons.attach_money),
                    Padding(
                      padding: const EdgeInsets.only(top: 32.0),
                      child: ButtonAction(
                        "Confirmar",
                        () => transferenciaDAO.save(new Transferencia(0, _contaController.text, "1", _valorController.text)).then((id) => Navigator.pop(context))
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class TextFormTransferencia extends StatelessWidget {
  const TextFormTransferencia({
    Key key,
    @required TextEditingController contaController,
    @required String hintText,
    @required IconData icon,
  })  : _contaController = contaController,
        _hintText = hintText,
        _icon = icon,
        super(key: key);

  final TextEditingController _contaController;
  final String _hintText;
  final IconData _icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _contaController,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: _hintText,
          prefixIcon: Icon(_icon),
        ),
      ),
    );
  }
}

class ButtonAction extends StatelessWidget {
  final Function _function;
  final String _buttonText;

  const ButtonAction(this._buttonText, this._function);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      child: RaisedButton(
        onPressed: _function,
        color: Color.fromRGBO(85, 175, 246, 1),
        splashColor: Color.fromRGBO(25, 8, 42, 0.8),
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10),
        // ),
        child: Text(
          _buttonText,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
