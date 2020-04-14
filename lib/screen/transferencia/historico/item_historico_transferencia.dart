import 'package:flutter/material.dart';
import 'package:internet_bank/models/Transferencia.dart';

class ItemHistoricoTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  ItemHistoricoTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(this._transferencia.getContaDestino()),
        subtitle: Text(this._transferencia.getValor()),
        leading: Icon(Icons.monetization_on),
      ),
    );
  }
}