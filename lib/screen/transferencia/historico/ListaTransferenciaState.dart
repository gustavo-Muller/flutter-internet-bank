import 'package:flutter/material.dart';
import 'package:internet_bank/database/dao/transferencia_dao.dart';
import 'package:internet_bank/models/Transferencia.dart';
import 'package:internet_bank/screen/transferencia/historico/transferencia_historico_screen.dart';

import 'item_historico_transferencia.dart';

class LsitaTransferenciaState extends State<TransferenciaHistorico> {
  @override
  Widget build(BuildContext context) {
    final _transferenciaDAO = TransferenciaDAO();

    return Scaffold(
      appBar: AppBar(
        title: Text("Teste"),
      ),
      body: FutureBuilder<List<Transferencia>>(
        initialData: List(),
        future: Future.delayed(Duration(seconds: 2))
            .then((value) => _transferenciaDAO.findAll()),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text("Carregando"),
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              var transferencias = snapshot.data;

              return ListView.builder(
                itemCount: transferencias == null ? 0 : transferencias.length,
                itemBuilder: (context, index) {
                  var transferencia = transferencias[index];
                  return ItemHistoricoTransferencia(transferencia);
                },
              );
              break;
          }
          return null;
        },
      ),
    );
  }
}
