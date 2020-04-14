import 'package:flutter/material.dart';

class InformationHome extends StatefulWidget {
  final String saldoConta;
  final String valorFatura;

  InformationHome({this.saldoConta, this.valorFatura});

  @override
  _InformationHomeState createState() => _InformationHomeState();
}

class _InformationHomeState extends State<InformationHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildRow(Icons.attach_money, "Saldo Atual"),
          Text(
            "R\$ " + widget.saldoConta,
            style: TextStyle(
              fontSize: 40.0,
            ),
          ),
          //-------------
          Padding(padding: const EdgeInsets.only(top: 32.0)),
          //-------------
          buildRow(Icons.credit_card, "Fatura Atual"),
          Text(
            "R\$ " + widget.valorFatura,
            style: TextStyle(
              fontSize: 40.0,
            ),
          ),
        ],
      ),
    );
  }

  Row buildRow(IconData icon, String nome) {
    return Row(
      children: <Widget>[
        Icon(icon),
        Text(
          nome,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }

}
