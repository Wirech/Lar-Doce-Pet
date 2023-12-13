class Ajudante{
  String id;
  String nome;
  String email;
  //String telefone;
  //String bio;
  //String endereco;
  //String cpf;
  //String numero;

  Ajudante({
    required this.id,
    required this.nome,
    required this.email,
    });

  Ajudante.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        nome = map["nome"],
        email = map["email"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "nome": nome,
      "email": email,
    };
  }
}
