class Cliente {
  String name;
  String document;
  String email;
  String phone;
  String address;
  bool active;

  Cliente({
    required this.name,
    required this.document,
    required this.email,
    required this.phone,
    required this.address,
    required this.active,
  });

// converte JSON recebido da API em objeto Dart
}

//  "id": 1,
//     "nome": "Cliente Demonstração",
//     "documento": "00000000000",
//     "email": "cliente@exemplo.com",
//     "telefone": "(46) 99999-0000",
//     "endereco": "Pato Branco - PR",
//     "ativo": true
