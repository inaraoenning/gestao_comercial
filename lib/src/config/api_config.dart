class ApiConfig {
  static const String baseUrl = String.fromEnvironment('API_URL',
      defaultValue: 'https://gestao-comercial-api.onrender.com');
}

// class ApiConfig cria um agrupador chamado ApiConfig.

// static permite acessar a URL sem criar um objeto.

// const informa que o valor não mudará durante a execução.

// String.fromEnvironment procura o parâmetro API_URL.

// defaultValue é usado quando nenhum parâmetro é informado
