import 'package:flutter/material.dart';

class CatalogoScreen extends StatelessWidget {
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
      appBar: AppBar(title: const Text('Categoria')),
      // adciona um espaçamento interno ao redor do conteúdo
      body: Padding(
        // define 16 pixels lógicos de espaço em todos os lados
        padding: const EdgeInsets.all(16),
        // organiza os widgets verticalmente, de cima para baixo
        child: Column(
          // faz os filhos ocuparem toda a largura disponível no eixo horizontal da coluna (Column)
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // lista os widgets que serão exibidos na coluna
          children: [
            const Text(
              'Lista de produtos',
              style: TextStyle(
                fontSize: 18, // define o tamanho da fonte
                fontWeight: FontWeight.bold, // deixa o texto em negrito
              ),
            ),
            // cria um espaço vertical
            const SizedBox(height: 8),
            // faz a lista ocupar o espaço vertical disponível dentro da Column. considerando os outros elementos
            Expanded(
              // cria uma lista vertical com rolagem.
              // buider constrói os itens conforme necessário,
              // sendo útil para listas que podem ter muitos elementos
              child: ListView.builder(
                // define a quantidade de itens
                // produto.length retorna 6 neste exemplo
                itemCount: produtos.length,
                // função chamada pelo ListView para construir cada item da lista
                // index representa a posição do item, começando em 0
                itemBuilder: (context, index) {
                  // cria um cartão visual ao redor de cada produto
                  return Card(
                    // adiciona 4 pixels de margem acima e abaixo do cartão
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    // cria uma linha pronta para listas,
                    // com espaço para icone, titulo e informações adicionais
                    child: ListTile(
                      // exibe um icone de sacola no inicio da linha
                      leading: const Icon(Icons.shopping_bag),
                      // Exibe o nome do produto
                      title: Text(produtos[index]),
                      // exibe uma descrição abaixa do nome
                      // ${index+1} interpola o valor calculado
                      // como o indice começa em 0, os numeros começam em 1
                      subtitle: Text('Produto ${index + 1}'),

                      trailing: const Icon(Icons.chevron_right),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Grade de produtos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),
            // faz a grade ocupar parte do espaço vertical restante
            // como há dois expanded na mesma Column, o espaço flexível é dividido igualmente entre eles, após descontar os demais elementos e os espaçamentos

            Expanded(
              // cria uma grade com rolagem, organizando os itens em linhas e colunas
              child: GridView.builder(
                itemCount: produtos.length,

                // define que seram exibidos 6 itens na grade
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  // exibe 2 colunas por linha
                  crossAxisCount: 2,
                  // define 10 pixels logicos de espaço horizontal entre as colunas
                  crossAxisSpacing: 10,
                  // define 10 pixels logicos de espaço vertical entre as colunas
                  mainAxisSpacing: 10,
                  // define a proporção entre largura e altura de cada item
                  // 1.6 significa que cada item será aproximandamente 1,6 vez mais largo do que alto
                  childAspectRatio: 1.6,

                ),
                // constroi cada elemento da grade
                // index identifica o produto atual
                itemBuilder: (context,index){
                  // cria uma caixa que pode receber alinhamento, cor , bordas, margens internas e outros estilos
                  return Container(
                    // centraliza o conteúdo dentro da caixa,
                    // tanto vertical quanto horizontal
                    alignment: Alignment.center,
                    
                    // define a aparência visul do Container
                    decoration: BoxDecoration(
                      // define uma cor roxa bem clara para o fundo
                      color: Colors.deepPurple,
                      // color: Colors.deepPurple.shade50,
                      // arredonda os cantos da caixa com raio de 12 pixels logicos
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: Text(
                      // exibe o nome do produto correspondente ao índice
                      produtos[index],

                      // centraliza o texto horizontalmente 
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
