class Transferencia{
  int _id;
  String _contaDestino;
  String _contaMandante;
  String _valor;

  Transferencia(this._id, this._contaDestino, this._contaMandante, this._valor);

  getId() => this._id;
  getContaDestino() => this._contaDestino;
  getContaMandante() => this._contaMandante;
  getValor() => this._valor;

}