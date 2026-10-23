import 'package:flutter/material.dart';

// StatefulWidget é usado quando a tela possui dados que podem mudar
class PreferenceScreen extends StatefulWidget {
  const PreferenceScreen({super.key});

  // cria o objeto que controla o estado desta tela
  @override
  State<PreferenceScreen> createState() {
    // retorna a classe que guarda as variaveis e constroi a interface
    return _PreferenceScreenState();
  }
}

// classe responsável pelo estado e pela interface da tela
// o '_' no início indica que a classe é privada neste arquivo
class _PreferenceScreenState extends State<PreferenceScreen> {
  // guarda o nome digitado

  String nome = '';
  // guarda a linguagem escolhida
  // o '?' permite que a variável também seja null,
  // ou seja, nenhuma linguagem selecionada
  String? linguagem;

  String nivel = 'Iniciante';

  bool estudarFlutter = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preferências')),
      // permite rolar a tela quando o conteudo não caber
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Configure suas preferências',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Nome',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                onChanged: (novoValor) {
                  setState(() {
                    nome = novoValor;
                  });
                },
              ),
              const SizedBox(height: 20),
              // menu suspenso para escolher uma linguagem
              DropdownButton<String>(
                // indica qual opção esta selecionada
                value: linguagem,
                // Faz o menu ocupar a largura disponivel
                isExpanded: true,
                // texto exibido quando não há seleção
                hint: const Text('Escolha uma linguagem'),
                // opções disponiveis no menu
                items: const [
                  DropdownMenuItem(value: 'Flutter', child: Text('Flutter')),
                  DropdownMenuItem(
                    value: 'Javascript',
                    child: Text('Javascript'),
                  ),
                  DropdownMenuItem(value: 'Python', child: Text('Python')),
                  DropdownMenuItem(value: 'Node.js', child: Text('Node.js')),
                ],
                onChanged: (novoValor) {
                  setState(() {
                    linguagem = novoValor;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text (
                'Nivel de conhecimento',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),

              // opção de nivel 
              RadioListTile<String>(
                title: const Text('Iniciante'),
                // valor que ele representa
                value: 'Iniciante',
                // valor atualmente selecionado no grupo
                groupValue: nivel,
                onChanged: (novoValor){
                  setState(() {
                    nivel = novoValor ?? nivel;
                  });
                },
              ),

               RadioListTile<String>(
                title: const Text('Intermediario'),
                // valor que ele representa
                value: 'Intermediario',
                // valor atualmente selecionado no grupo
                groupValue: nivel,
                onChanged: (novoValor){
                  setState(() {
                    nivel = novoValor ?? nivel;
                  });
                },
              ),

               RadioListTile<String>(
                title: const Text('Avançado'),
                // valor que ele representa
                value: 'Avançado',
                // valor atualmente selecionado no grupo
                groupValue: nivel,
                onChanged: (novoValor){
                  setState(() {
                    nivel = novoValor ?? nivel;
                  });
                },
              ),

              const Divider(),

              SwitchListTile(
                title: const Text('Quero estudar Flutter'),

                value: estudarFlutter,

                onChanged: (novoValor){
                  setState(() {
                    estudarFlutter = novoValor;
                  });
                },
              ),

              const SizedBox(height: 20),
              // Botão para mostrar as preferências
              ElevatedButton(
                // função executada quando o botão é pressionado
                onPressed: () {
                  showDialog(
                    context: context,
                    // constroi o conteudo da janela
                    builder: (context) {
                      return AlertDialog(
                        // titulo da janela
                        title: const Text('Suas preferências'),
                        // mostra os valores guardados nas variaveis
                        content: Text(
                          'Nome: $nome\n'
                          'Linguagem: ${linguagem ?? "Não selecionada"}\n'
                          'Nível: $nivel\n',
                        ),
                        // lista os botoes da janela
                        actions: [
                          // Botão para fechar o dialogo
                          TextButton(
                            onPressed: () {
                              // fecha a janela ataul
                              Navigator.pop(context);
                            },
                            // texto do botão
                            child: const Text('Fechar'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Mostra preferências'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
