
/*
  PROJETO: Consumindo uma API REST com Flutter

  API utilizada:
  https://jsonplaceholder.typicode.com/posts

  OBJETIVO:
  - Realizar uma requisição HTTP GET.
  - Receber informações no formato JSON.
  - Converter JSON em objetos Dart.
  - Exibir os dados em uma lista.
  - Permitir visualizar os detalhes de uma postagem.
  - Atualizar os dados quando necessário.
*/

// Importa a biblioteca dart:convert.
// Essa biblioteca permite converter informações entre
// JSON, String e outros formatos de dados.
import 'dart:convert';

// Importa a biblioteca Material do Flutter.
// Disponibiliza widgets como MaterialApp, Scaffold,
// AppBar, Text, Card, Column, ListView e botões.
import 'package:flutter/material.dart';

// Importa a biblioteca HTTP.
// Ela permite realizar requisições para APIs REST.
//
// O apelido "http" facilita o acesso aos métodos:
// http.get(), http.post(), http.put(), http.delete().
import 'package:http/http.dart' as http;


// =====================================================
// 1. FUNÇÃO PRINCIPAL
// =====================================================

// A função main() é o ponto de entrada do aplicativo.
// Toda aplicação Dart começa sua execução pelo main().
void main() {

  // runApp() inicializa a interface gráfica do Flutter.
  //
  // MeuApp() representa o widget principal.
  //
  // const informa que o widget pode ser criado
  // como um objeto constante.
  runApp(const MeuApp());

}


// =====================================================
// 2. WIDGET PRINCIPAL DO APLICATIVO
// =====================================================

// Cria a classe MeuApp.
//
// extends significa que a classe herda características
// de outra classe.
//
// StatelessWidget representa um widget que não possui
// estado interno mutável gerenciado por ele.
class MeuApp extends StatelessWidget {

  // Construtor da classe MeuApp.
  //
  // super.key encaminha a chave opcional para
  // o construtor da classe pai.
  const MeuApp({super.key});

  // @override indica que estamos sobrescrevendo
  // um método definido na classe pai.
  @override

  // O método build() constrói a interface do widget.
  //
  // Widget é o tipo de retorno.
  //
  // BuildContext representa a posição do widget
  // dentro da árvore de widgets do Flutter.
  Widget build(BuildContext context) {

    // MaterialApp configura a estrutura principal
    // da aplicação utilizando Material Design.
    return MaterialApp(

      // Remove a faixa vermelha de DEBUG
      // exibida durante o desenvolvimento.
      debugShowCheckedModeBanner: false,

      // Define um título para o aplicativo.
      title: 'Consumindo API REST',

      // Configura a aparência geral da aplicação.
      theme: ThemeData(

        // Cria um conjunto de cores baseado
        // em uma cor principal.
        colorScheme: ColorScheme.fromSeed(

          // Define azul como cor base do tema.
          seedColor: Colors.blue,

        ),

        // Ativa o padrão visual Material Design 3.
        useMaterial3: true,

      ),

      // Define qual widget será exibido
      // quando o aplicativo for iniciado.
      //
      // Nesse caso, a tela de listagem de postagens.
      home: const TelaPostagens(),

    );

  }

}


// =====================================================
// 3. CLASSE MODELO DOS DADOS
// =====================================================

// A classe Postagem representa uma postagem
// recebida da API.
//
// Cada objeto Postagem armazenará os dados
// de uma postagem específica.
class Postagem {

  // Armazena o identificador do usuário
  // responsável pela postagem.
  //
  // int representa um número inteiro.
  //
  // final significa que, depois de inicializado,
  // o atributo não pode receber outro valor.
  final int userId;

  // Armazena o identificador da postagem.
  final int id;

  // Armazena o título da postagem.
  //
  // String representa um texto.
  final String title;

  // Armazena o conteúdo da postagem.
  final String body;


  // -------------------------------------------------
  // CONSTRUTOR DA CLASSE POSTAGEM
  // -------------------------------------------------

  // O construtor é executado quando criamos
  // um novo objeto da classe Postagem.
  Postagem({

    // required obriga o fornecimento do parâmetro.
    //
    // this.userId recebe o valor informado
    // e o atribui ao atributo userId do objeto.
    required this.userId,

    // Recebe o identificador da postagem.
    required this.id,

    // Recebe o título da postagem.
    required this.title,

    // Recebe o conteúdo da postagem.
    required this.body,

  });


  // -------------------------------------------------
  // CONVERSÃO DE JSON PARA OBJETO DART
  // -------------------------------------------------

  // factory define um construtor de fábrica.
  //
  // Nesse caso, ele cria um objeto Postagem
  // a partir de informações recebidas em JSON.
  //
  // Map<String, dynamic> representa uma estrutura
  // com pares de chave e valor.
  //
  // String representa o tipo das chaves.
  //
  // dynamic permite valores de diferentes tipos.
  factory Postagem.fromJson(Map<String, dynamic> json) {

    // Cria e retorna um objeto Postagem.
    return Postagem(

      // Acessa o campo userId do JSON.
      //
      // "as int" informa que o valor
      // deve ser tratado como número inteiro.
      userId: json['userId'] as int,

      // Recupera o identificador da postagem.
      id: json['id'] as int,

      // Recupera o título da postagem.
      //
      // "as String" verifica que o valor é texto.
      title: json['title'] as String,

      // Recupera o conteúdo da postagem.
      body: json['body'] as String,

    );

  }

}


// =====================================================
// 4. TELA DE LISTAGEM DAS POSTAGENS
// =====================================================

// StatefulWidget representa um widget que possui
// um objeto State associado.
//
// Esse State pode armazenar dados que mudam
// durante a execução do aplicativo.
//
// Utilizamos StatefulWidget porque precisamos
// atualizar as postagens após novas requisições.
class TelaPostagens extends StatefulWidget {

  // Construtor da tela.
  const TelaPostagens({super.key});

  // @override sobrescreve o método da classe pai.
  @override

  // createState() cria o objeto responsável
  // por controlar o estado da tela.
  //
  // A seta => é uma forma abreviada de retornar
  // o resultado de uma expressão.
  State<TelaPostagens> createState() => _TelaPostagensState();

}


// =====================================================
// 5. ESTADO DA TELA DE POSTAGENS
// =====================================================

// Essa classe controla os dados e as mudanças
// que ocorrem na tela TelaPostagens.
//
// O underline no início do nome (_TelaPostagensState)
// indica que a classe é privada para a biblioteca Dart.
class _TelaPostagensState extends State<TelaPostagens> {


  // -------------------------------------------------
  // VARIÁVEL QUE ARMAZENA A CONSULTA
  // -------------------------------------------------

  // late informa que a variável será inicializada
  // posteriormente, antes de ser utilizada.
  //
  // Future representa um resultado que estará
  // disponível futuramente.
  //
  // List<Postagem> representa uma lista de objetos
  // da classe Postagem.
  //
  // Portanto, essa variável armazena uma operação
  // assíncrona que produzirá uma lista de postagens.
  late Future<List<Postagem>> postagens;


  // -------------------------------------------------
  // INICIALIZAÇÃO DA TELA
  // -------------------------------------------------

  // initState() é chamado uma vez quando
  // o objeto State é inicializado.
  @override
  void initState() {

    // Executa a inicialização da classe pai.
    //
    // Essa chamada é necessária para respeitar
    // o ciclo de vida do StatefulWidget.
    super.initState();

    // Chama a função buscarPostagens().
    //
    // A função inicia uma requisição HTTP e
    // devolve um Future<List<Postagem>>.
    //
    // O resultado futuro é armazenado em postagens.
    postagens = buscarPostagens();

  }


  // =================================================
  // 6. FUNÇÃO QUE CONSULTA A API
  // =================================================

  // Future<List<Postagem>> indica que a função
  // retornará futuramente uma lista de postagens.
  //
  // async permite utilizar await dentro da função.
  //
  // await aguarda o resultado de uma operação
  // assíncrona sem bloquear a interface gráfica.
  Future<List<Postagem>> buscarPostagens() async {


    // -----------------------------------------------
    // ENDEREÇO DA API
    // -----------------------------------------------

    // final cria uma variável que só pode
    // receber um valor uma vez.
    //
    // Uri.parse() transforma o endereço em texto
    // em um objeto Uri.
    //
    // Um objeto Uri representa um endereço
    // que pode ser utilizado em requisições HTTP.
    final url = Uri.parse(

      // Endpoint que retorna as postagens da API.
      'https://jsonplaceholder.typicode.com/posts',

    );


    // -----------------------------------------------
    // REQUISIÇÃO HTTP GET
    // -----------------------------------------------

    // http.get(url) envia uma requisição HTTP GET.
    //
    // GET é utilizado para consultar informações.
    //
    // await aguarda a conclusão da requisição.
    //
    // O resultado é armazenado em "resposta".
    final resposta = await http.get(url).timeout(

      // Define o tempo máximo de espera
      // para a operação HTTP.
      //
      // Se ultrapassar 15 segundos,
      // será lançada uma exceção de timeout.
      const Duration(seconds: 15),

    );


    // -----------------------------------------------
    // VERIFICAÇÃO DA RESPOSTA
    // -----------------------------------------------

    // statusCode contém o código HTTP retornado.
    //
    // 200 significa que a requisição foi
    // processada com sucesso.
    //
    // Outros códigos podem representar erros,
    // como 404 (não encontrado) ou
    // 500 (erro interno do servidor).
    if (resposta.statusCode == 200) {


      // ---------------------------------------------
      // CONVERSÃO DA RESPOSTA PARA JSON
      // ---------------------------------------------

      // resposta.bodyBytes contém os dados recebidos
      // da API em formato de bytes.
      //
      // utf8.decode() converte os bytes em texto.
      //
      // jsonDecode() interpreta o texto JSON
      // e o transforma em estruturas Dart.
      //
      // Como o endpoint retorna um array JSON,
      // utilizamos List<dynamic>.
      //
      // dynamic permite armazenar elementos
      // cujo tipo será verificado em execução.
      final List<dynamic> dados = jsonDecode(

        utf8.decode(resposta.bodyBytes),

      );


      // ---------------------------------------------
      // CONVERSÃO DOS DADOS EM OBJETOS POSTAGEM
      // ---------------------------------------------

      // map() percorre cada elemento da lista.
      //
      // Para cada elemento será criado
      // um objeto da classe Postagem.
      return dados.map((item) {

        // Postagem.fromJson() transforma
        // os campos JSON em um objeto Postagem.
        //
        // "as Map<String, dynamic>" informa
        // que o item deve ser um mapa JSON.
        return Postagem.fromJson(

          item as Map<String, dynamic>,

        );

        // toList() transforma o resultado do map()
        // em uma lista de objetos Postagem.
      }).toList();

    } else {

      // Caso o servidor retorne um código
      // diferente de 200, uma exceção será lançada.
      //
      // throw é utilizado para lançar erros.
      //
      // Exception representa uma exceção.
      //
      // ${resposta.statusCode} insere o código
      // HTTP dentro da mensagem utilizando
      // interpolação de String.
      throw Exception(

        'Erro HTTP: ${resposta.statusCode}',

      );

    }

  }


  // =================================================
  // 7. FUNÇÃO PARA ATUALIZAR A LISTA
  // =================================================

  // void indica que a função não retorna um valor.
  void atualizarPostagens() {

    // setState() informa ao Flutter que
    // houve uma alteração no estado da tela.
    //
    // Após essa alteração, o Flutter agenda
    // uma nova construção da interface.
    setState(() {

      // Executa uma nova consulta à API.
      //
      // O Future antigo é substituído por
      // um novo Future.
      postagens = buscarPostagens();

    });

  }


  // =================================================
  // 8. CONSTRUÇÃO DA INTERFACE
  // =================================================

  @override
  Widget build(BuildContext context) {

    // Scaffold cria a estrutura visual básica
    // de uma tela Material Design.
    //
    // Possui propriedades como:
    // appBar, body, drawer e floatingActionButton.
    return Scaffold(


      // =============================================
      // BARRA SUPERIOR DO APLICATIVO
      // =============================================

      // appBar define a barra superior da tela.
      appBar: AppBar(

        // Define o título da barra superior.
        title: const Text('Postagens da API'),

        // Define a cor de fundo da AppBar.
        backgroundColor: Colors.blue,

        // Define a cor dos textos e ícones
        // exibidos na AppBar.
        foregroundColor: Colors.white,


        // actions representa uma lista de widgets
        // exibidos à direita da barra superior.
        actions: [

          // IconButton cria um botão com ícone.
          IconButton(

            // Define o ícone de atualização.
            icon: const Icon(Icons.refresh),

            // Define a descrição do botão.
            //
            // O texto pode aparecer quando
            // o usuário mantém o mouse sobre ele.
            tooltip: 'Atualizar postagens',

            // onPressed define a função executada
            // quando o botão é pressionado.
            //
            // Nesse caso, chamamos atualizarPostagens.
            onPressed: atualizarPostagens,

          ),

        ],

      ),


      // =============================================
      // CORPO PRINCIPAL DA TELA
      // =============================================

      // body define o conteúdo principal do Scaffold.
      //
      // FutureBuilder é um widget que acompanha
      // o resultado de operações assíncronas.
      //
      // <List<Postagem>> representa o tipo
      // de resultado esperado.
      body: FutureBuilder<List<Postagem>>(

        // future informa qual operação assíncrona
        // o FutureBuilder deverá acompanhar.
        future: postagens,


        // builder é uma função que constrói
        // a interface de acordo com o estado
        // da operação assíncrona.
        //
        // context representa o contexto da interface.
        //
        // snapshot contém informações sobre
        // o estado e o resultado do Future.
        builder: (context, snapshot) {


          // =========================================
          // 9. VERIFICANDO O CARREGAMENTO
          // =========================================

          // connectionState indica o estado
          // da operação assíncrona.
          //
          // ConnectionState.waiting significa
          // que a operação ainda está pendente.
          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            // Center centraliza seu widget filho
            // no espaço disponível.
            return const Center(

              // CircularProgressIndicator exibe
              // uma animação circular de carregamento.
              child: CircularProgressIndicator(),

            );

          }


          // =========================================
          // 10. TRATAMENTO DE ERROS
          // =========================================

          // snapshot.hasError verifica se
          // ocorreu algum erro na operação.
          //
          // Exemplos:
          // - Falha de conexão;
          // - Tempo de espera excedido;
          // - Erro HTTP;
          // - Erro na conversão dos dados.
          if (snapshot.hasError) {

            // Exibe um conteúdo centralizado.
            return Center(

              // Column organiza seus filhos
              // verticalmente.
              child: Column(

                // Faz a coluna ocupar somente
                // o espaço necessário.
                mainAxisSize: MainAxisSize.min,

                // Lista de widgets da coluna.
                children: [

                  // Exibe um ícone de erro.
                  const Icon(

                    // Ícone que representa um erro.
                    Icons.error_outline,

                    // Tamanho do ícone em pixels lógicos.
                    size: 50,

                    // Cor vermelha.
                    color: Colors.red,

                  ),


                  // SizedBox cria um espaço vazio.
                  //
                  // Aqui adicionamos 12 pixels lógicos
                  // de espaço vertical.
                  const SizedBox(height: 12),


                  // Exibe uma mensagem ao usuário.
                  const Text(

                    'Erro ao carregar as postagens',

                  ),


                  // Adiciona espaçamento vertical.
                  const SizedBox(height: 8),


                  // Padding adiciona espaçamento
                  // interno em torno de seu filho.
                  Padding(

                    // EdgeInsets.all(16) adiciona
                    // 16 pixels lógicos em cada lado.
                    padding: const EdgeInsets.all(16),

                    // Exibe a descrição do erro.
                    child: Text(

                      // snapshot.error contém
                      // o erro ocorrido.
                      //
                      // ${} insere o valor do erro
                      // dentro da String.
                      '${snapshot.error}',

                      // Centraliza o texto.
                      textAlign: TextAlign.center,

                    ),

                  ),


                  // ElevatedButton cria um botão
                  // com aparência de destaque.
                  ElevatedButton(

                    // Quando pressionado, tenta
                    // realizar uma nova consulta.
                    onPressed: atualizarPostagens,

                    // Texto exibido dentro do botão.
                    child: const Text('Tentar novamente'),

                  ),

                ],

              ),

            );

          }


          // =========================================
          // 11. RECUPERANDO OS DADOS
          // =========================================

          // snapshot.data contém o resultado
          // retornado pela operação assíncrona.
          //
          // ?? é o operador de coalescência nula.
          //
          // Se snapshot.data for null,
          // será utilizada uma lista vazia [].
          final lista = snapshot.data ?? [];


          // =========================================
          // 12. VERIFICANDO SE A LISTA ESTÁ VAZIA
          // =========================================

          // isEmpty retorna true quando
          // a lista não possui elementos.
          if (lista.isEmpty) {

            // Exibe uma mensagem centralizada.
            return const Center(

              child: Text(
                'Nenhuma postagem encontrada.',
              ),

            );

          }


          // =========================================
          // 13. CRIANDO A LISTA DE POSTAGENS
          // =========================================

          // ListView.builder cria uma lista
          // com rolagem vertical.
          //
          // Os itens são construídos conforme
          // a necessidade de exibição na tela.
          return ListView.builder(

            // Adiciona 12 pixels lógicos
            // de espaçamento interno à lista.
            padding: const EdgeInsets.all(12),


            // itemCount informa a quantidade
            // de elementos que serão exibidos.
            //
            // lista.length retorna a quantidade
            // de postagens recebidas da API.
            itemCount: lista.length,


            // itemBuilder define como cada item
            // da lista será construído.
            //
            // index representa a posição atual
            // do item dentro da lista.
            //
            // O primeiro índice de uma lista
            // em Dart é sempre zero.
            itemBuilder: (context, index) {


              // Recupera a postagem correspondente
              // à posição atual da lista.
              final postagem = lista[index];


              // =====================================
              // 14. CARD DE CADA POSTAGEM
              // =====================================

              // Card cria um componente visual
              // semelhante a um cartão.
              return Card(

                // Define a margem externa do Card.
                //
                // only(bottom: 12) adiciona
                // 12 pixels lógicos abaixo do cartão.
                margin: const EdgeInsets.only(bottom: 12),


                // Define a elevação visual do Card,
                // influenciando sua sombra.
                elevation: 2,


                // Padding cria espaçamento
                // interno no cartão.
                child: Padding(

                  // Espaçamento de 12 pixels lógicos
                  // em todos os lados.
                  padding: const EdgeInsets.all(12),


                  // Column organiza os elementos
                  // verticalmente dentro do Card.
                  child: Column(

                    // Alinha os widgets ao início
                    // do eixo horizontal da coluna.
                    crossAxisAlignment:
                        CrossAxisAlignment.start,


                    // Lista de elementos exibidos
                    // dentro de cada postagem.
                    children: [


                      // =================================
                      // IDENTIFICADOR DA POSTAGEM
                      // =================================

                      // Widget Text exibe textos.
                      Text(

                        // Exibe o identificador da postagem.
                        //
                        // ${postagem.id} recupera o ID
                        // do objeto Postagem atual.
                        'Postagem #${postagem.id}',

                        // Define a formatação do texto.
                        style: const TextStyle(

                          // Cor do texto.
                          color: Colors.blue,

                          // Texto em negrito.
                          fontWeight: FontWeight.bold,

                        ),

                      ),


                      // Espaçamento vertical.
                      const SizedBox(height: 8),


                      // =================================
                      // TÍTULO DA POSTAGEM
                      // =================================

                      // Exibe o título da postagem.
                      Text(

                        // Recupera o atributo title
                        // do objeto Postagem.
                        postagem.title,

                        // Define o estilo do título.
                        style: const TextStyle(

                          // Tamanho da fonte.
                          fontSize: 18,

                          // Texto em negrito.
                          fontWeight: FontWeight.bold,

                        ),

                      ),


                      // Espaçamento entre os elementos.
                      const SizedBox(height: 8),


                      // =================================
                      // DESCRIÇÃO DA POSTAGEM
                      // =================================

                      // Exibe o conteúdo da postagem.
                      Text(

                        // Recupera o atributo body
                        // da postagem atual.
                        postagem.body,

                        // Limita o texto a duas linhas.
                        maxLines: 2,

                        // Quando o conteúdo ultrapassar
                        // duas linhas, serão exibidos
                        // três pontos (...).
                        overflow: TextOverflow.ellipsis,

                      ),


                      // Espaçamento vertical.
                      const SizedBox(height: 8),


                      // =================================
                      // BOTÃO VER DETALHES
                      // =================================

                      // Align posiciona um widget
                      // dentro do espaço disponível.
                      Align(

                        // Alinha o botão à direita.
                        alignment: Alignment.centerRight,


                        // TextButton cria um botão
                        // com aparência de texto.
                        child: TextButton(


                          // onPressed define a ação
                          // executada ao clicar no botão.
                          onPressed: () {


                            // Navigator.push() abre
                            // uma nova rota ou tela.
                            //
                            // A tela atual permanece
                            // na pilha de navegação.
                            Navigator.push(

                              // Contexto da tela atual.
                              context,


                              // MaterialPageRoute define
                              // uma rota com comportamento
                              // de navegação Material Design.
                              MaterialPageRoute(

                                // builder constrói
                                // a nova tela.
                                builder: (context) =>

                                    // Cria a tela de detalhes.
                                    TelaDetalhes(

                                  // Envia a postagem selecionada
                                  // para a próxima tela.
                                  postagem: postagem,

                                ),

                              ),

                            );

                          },


                          // Define o texto do botão.
                          child: const Text('Ver detalhes'),

                        ),

                      ),

                    ],

                  ),

                ),

              );

            },

          );

        },

      ),

    );

  }

}


// =====================================================
// 15. TELA DE DETALHES DA POSTAGEM
// =====================================================

// StatelessWidget é utilizado porque os dados
// recebidos nesta tela não precisam ser alterados
// durante sua exibição.
//
// A tela recebe um objeto Postagem e apresenta
// suas informações completas.
class TelaDetalhes extends StatelessWidget {


  // Atributo responsável por armazenar
  // a postagem recebida da tela anterior.
  final Postagem postagem;


  // Construtor da tela de detalhes.
  const TelaDetalhes({

    // Encaminha a chave para a classe pai.
    super.key,

    // Obriga o fornecimento de uma postagem.
    required this.postagem,

  });


  // Sobrescreve o método responsável
  // pela construção da interface.
  @override
  Widget build(BuildContext context) {


    // Scaffold cria a estrutura básica da tela.
    return Scaffold(


      // =============================================
      // BARRA SUPERIOR
      // =============================================

      // Define a AppBar da tela de detalhes.
      appBar: AppBar(

        // Título da tela.
        title: const Text('Detalhes da Postagem'),

        // Cor de fundo da barra.
        backgroundColor: Colors.blue,

        // Cor do texto e do botão de voltar.
        foregroundColor: Colors.white,

      ),


      // =============================================
      // CORPO DA TELA
      // =============================================

      // body define o conteúdo principal.
      body: Padding(

        // Aplica 20 pixels lógicos
        // de espaçamento em todos os lados.
        padding: const EdgeInsets.all(20),


        // Column organiza os elementos verticalmente.
        child: Column(

          // Alinha os elementos à esquerda.
          crossAxisAlignment: CrossAxisAlignment.start,


          // Lista de widgets da tela.
          children: [


            // ========================================
            // IDENTIFICADOR DA POSTAGEM
            // ========================================

            // Exibe o identificador da postagem.
            Text(

              // Recupera o ID da postagem recebida.
              'Postagem #${postagem.id}',

              // Define o estilo do texto.
              style: const TextStyle(

                // Tamanho da fonte.
                fontSize: 16,

                // Cor azul.
                color: Colors.blue,

              ),

            ),


            // Espaçamento vertical de 16 pixels.
            const SizedBox(height: 16),


            // ========================================
            // TÍTULO DA POSTAGEM
            // ========================================

            // Exibe o título completo da postagem.
            Text(

              // Acessa o atributo title
              // do objeto Postagem.
              postagem.title,

              // Define a formatação do título.
              style: const TextStyle(

                // Fonte com tamanho 24.
                fontSize: 24,

                // Texto em negrito.
                fontWeight: FontWeight.bold,

              ),

            ),


            // Espaçamento vertical.
            const SizedBox(height: 20),


            // ========================================
            // CONTEÚDO COMPLETO DA POSTAGEM
            // ========================================

            // Exibe o conteúdo completo da postagem.
            Text(

              // Acessa o atributo body
              // do objeto Postagem.
              postagem.body,

              // Define o estilo do conteúdo.
              style: const TextStyle(

                // Tamanho da fonte.
                fontSize: 17,

                // Define a altura da linha
                // proporcionalmente ao tamanho
                // da fonte.
                //
                // 1.5 representa uma altura
                // de linha de 1,5 vez.
                height: 1.5,

              ),

            ),


            // Espaçamento vertical.
            const SizedBox(height: 24),


            // ========================================
            // IDENTIFICADOR DO USUÁRIO
            // ========================================

            // Exibe o usuário responsável
            // pela postagem.
            Text(

              // Recupera userId do objeto Postagem
              // e insere seu valor no texto.
              'Publicado pelo usuário: ${postagem.userId}',

              // Define o estilo do texto.
              style: const TextStyle(

                // Aplica a cor cinza.
                color: Colors.grey,

              ),

            ),

          ],

        ),

      ),

    );

  }

}
