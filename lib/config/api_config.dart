class ApiConfig {
  // endereço base da api, centralizado aqui pra não ficar
  // procurando url espalhada nas telas
  //
  // web local: http://localhost:8080/api
  // emulador android: http://10.0.2.2:8080/api
  //
  // dá pra trocar na hora de rodar sem mexer no código:
  // flutter run -d chrome --dart-define=API_URL=https://.../api
  //
  // sem barra no final, o service já coloca o /clientes etc
  static const String baseUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'https://gestao-comercial-api.onrender.com/api',
  );
}
