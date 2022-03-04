
class Favoritos {
  final int? id;
  final String? nome;
  final int? numerodaconta;

  Favoritos(
      this.id,
      this.nome,
      this.numerodaconta,
      );

  @override
  String toString() {
    return 'Favoritos{id: $id, nome: $nome, numerodaconta: $numerodaconta}';
  }


}