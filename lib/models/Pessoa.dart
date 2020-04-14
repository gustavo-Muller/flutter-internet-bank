class Pessoa{
  String _nome;
  String _profissao;
  int _id;

  Pessoa(this._id, this._nome, this._profissao);

  getId() => this._id;
  getNome() => this._nome;
  getProfissao() => this._profissao;

  @override
  String toString() {
    return 'Pessoa(Id = ${this._id}, Nome: ${this._nome}, Profissão: ${this._profissao})';
  }
}