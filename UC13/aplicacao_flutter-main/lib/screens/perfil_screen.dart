// importa a biblioteca material design do flutter
// essa biblioteca disponibiliza componentes visuais como
// Scaffold, AppBar, Text, Column, Row, Icon, Container e outros

import 'package:flutter/material.dart';

// Tela de Perfil que representa o perfil

// StatelessWidget é usando quando as informações do proprio widget não precisa mudar durante a interação
class PerfilScreen extends StatelessWidget {
  // super.key encaminha a chave do widget para o construtor da classe pai (StatelessWidget)

  //A key ajuda o Flutter a identificar widgets durante a atualização da interface
  const PerfilScreen({super.key});

  // @override indica que estamos sobrescrevendo um metodo que ja existe na classe pai
  @override
  // o metodo build é responsavel por construir a interface visual do widget
  // widget representa o tipo de retorno do metodo
  // BuilContext context fornece informações sobre a posição do widget na arvore de widgets
  Widget build(BuildContext context) {
    // Scaffold fornece a estrutura basica de uma tela Material Design
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meu perfil',
          // estilizando o nosso titulo
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        // Criando um espaço interno nos 4 lados
        padding: const EdgeInsets.all(16),
        //Padding apenas 1 unico filho.

        //Column será o filho por que precisamos organizar varios elementos vertical
        child: Column(
          // Em column, o eixo principal é VERTICAL
          // start coloca os filhos no inicio desse eixo: no topo.
          mainAxisAlignment: MainAxisAlignment.start,

          // O eixo transversal fica perpendicular.
          // Em column, ele deixa HORIZONTAL
          // stretch tenta ocupar a largura disponivel
          crossAxisAlignment: .stretch,
          children: [
            const CircleAvatar(
              // radius que controla o raio do circulo
              radius: 48,

              //cor de fundo do avatar
              backgroundColor: Colors.deepPurple,

              // recebe o conteudo interno
              child: Icon(
                // Recebe o Icone
                Icons.person,
                // Tamanho do Icone
                size: 48,
                // Cor do icone.
                color: Colors.white,
              ),
            ),

            SizedBox(height: 16), // estpaçamento vertical

            const Text(
              'Samira Vieira',
              // Alinhamento do Texto
              textAlign: TextAlign.center,
              // Stilizando o texto
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 4),

            const Text(
              'Desenvolvedora de Software',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            const SizedBox(height: 24),

            Container(
              margin: const EdgeInsets.only(bottom: 12),

              // epaçamento interno ( espaçamento dentro da nossa caixa)
              padding: const EdgeInsets.all(16),

              // Decoration controla a aparencia visual do container
              decoration: BoxDecoration(
                // cor de fundo
                color: Colors.deepPurple.shade50,
                // Arredonda os quatros cantos
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.email, size: 28),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'E-mail',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('samira@emaiil.com'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                children: [
                  Icon(Icons.phone, size: 28),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Telefone',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('(11) 99999-9999'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Tecnologias',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding:const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
                  Text('Flutter'),
                  Text('React'),
                  Text('Node.js'),
                ]
              )
              
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Editar perfil pressionado'
                      ),
                    ),
                  );
                },
                child: const Text('Editar perfil'),
                ),
            )

          ],
        ),
      ),
    );
  }
}
