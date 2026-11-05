class Cliente {
  // id é nulo antes de salvar, a api que gera depois do post
  final int? id;
  final String nome;
  final String documento;
  // esses 3 podem ser nulos, por isso o "?"
  final String? email;
  final String? telefone;
  final String? endereco;
  final bool ativo;

  const Cliente({
    this.id,
    required this.nome,
    required this.documento,
    this.email,
    this.telefone,
    this.endereco,
    this.ativo = true,
  });

  // pega o json que veio da api e monta o objeto dart
  // o ?? é o "se vier nulo, usa isso"
  factory Cliente.fromJson(Map<String, dynamic> json) => Cliente(
        id: json['id'] as int?,
        nome: json['nome'] ?? '',
        documento: json['documento'] ?? '',
        email: json['email'],
        telefone: json['telefone'],
        endereco: json['endereco'],
        ativo: json['ativo'] ?? true,
      );

  // faz o caminho contrário: objeto -> json pra mandar no post/put
  // não manda o id pq a api que controla isso
  Map<String, dynamic> toJson() => {
        'nome': nome,
        'documento': documento,
        'email': email,
        'telefone': telefone,
        'endereco': endereco,
        'ativo': ativo,
      };
}
