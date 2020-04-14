import 'package:flutter/material.dart';
import 'package:internet_bank/screen/transferencia/historico/transferencia_historico_screen.dart';
import 'package:internet_bank/screen/transferencia/transferencia_screen.dart';

class ActionHome extends StatefulWidget {
  @override
  _ActionHomeState createState() => _ActionHomeState();
}

class _ActionHomeState extends State<ActionHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ButtonAction("Transferência", _navigationToTransferencia),
          ButtonAction("Histórico de transação", _navigationToHistoricoTransferencia),
        ],
      ),
    );
  }

  _navigationToTransferencia() => Navigator.push(context, MaterialPageRoute(builder: (context) => TransferenciaScreen()));
  _navigationToHistoricoTransferencia() => Navigator.push(context, MaterialPageRoute(builder: (context) => TransferenciaHistorico()));
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
