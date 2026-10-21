import 'package:flutter/material.dart';

class CatalogoScreen extends StatelessWidget{
  const CatalogoScreen({super.key});

  // final indica que a variavel produtos não recebera outra lista depois de criada
  final List<String> produtos = const [
    'Notebook', 
    'Smartphone',
    'Tablet',
    'Monitor',
    'Teclado',
    'Mouse',
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categoria'),
      ),
      body: ListView.builder(
        // itemCount informa quantos itens a ListView deve construir
        itemCount: produtos.length,
        // itemBuilder e uma função chamada para construir cada item da lista 
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 6,
            ),
            child: ListTile(
              // leading aparece antes do title
              leading: const Icon(
                Icons.shopping_bag,
              ),

              title: Text(produtos[index]),

              subtitle: Text('Produto ${index + 1}'),

              trailing: const Icon(
                Icons.chevron_right,
              ),
            ),

          );
        }
      )
    );
  }
}