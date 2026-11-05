import 'package:flutter/material.dart';

// bolinha de carregamento, usada enquanto a api não respondeu
class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) =>
      const Center(child: CircularProgressIndicator());
}

// aparece quando a lista vem vazia da api
class EmptyView extends StatelessWidget {
  final String mensagem;

  const EmptyView(this.mensagem, {super.key});

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.inbox_outlined, size: 64),
            const SizedBox(height: 12),
            Text(mensagem),
          ],
        ),
      );
}

// snackbar de sucesso ou erro (erro fica vermelho)
void mostrarMensagem(BuildContext context, String mensagem,
    {bool erro = false}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(mensagem),
      backgroundColor: erro ? Theme.of(context).colorScheme.error : null,
    ),
  );
}

// dialog de confirmação pra ninguém excluir sem querer
// devolve true se clicou em "Excluir"
Future<bool> confirmarExclusao(BuildContext context, String nome) async {
  return await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Confirmar exclusão'),
          content: Text('Deseja realmente excluir "$nome"?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('Cancelar'),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Excluir'),
            ),
          ],
        ),
      ) ??
      false;
}
