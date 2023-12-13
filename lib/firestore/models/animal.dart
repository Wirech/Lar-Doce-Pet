

class Animal {
  String id;
  String sexo;
  String especie;
  String tamanho;
  String cor;
  String local;
  String url; // Modificado para File

  Animal({
    required this.id,
    required this.sexo,
    required this.especie,
    required this.tamanho,
    required this.cor,
    required this.local,
    required this.url, // Modificado para File
  });

  // Outros métodos e construtores

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sexo': sexo,
      'especie': especie,
      'tamanho': tamanho,
      'cor': cor,
      'local': local,
      'fotoUrl': url, // Remova ou atualize conforme necessário
    };
  }

  factory Animal.fromMap(Map<String, dynamic> map) {
    return Animal(
      id: map['id'],
      sexo: map['sexo'],
      especie: map['especie'],
      tamanho: map['tamanho'],
      cor: map['cor'],
      local: map['local'],
      url: map['fotoUrl'], // Remova ou atualize conforme necessário
    );
  }
}
