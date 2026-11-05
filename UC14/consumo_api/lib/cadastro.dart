
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// CONFIGURAÇÃO PRINCIPAL
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cadastro de Currículo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF182D4B),
        ),
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
      ),
      home: const CadastroCurriculoPage(),
    );
  }
}

// MODELO DOS CAMPOS DE UMA EXPERIÊNCIA
class Experiencia {
  final empresa = TextEditingController();
  final cargo = TextEditingController();
  final periodo = TextEditingController();
  final atividades = TextEditingController();

  void dispose() {
    empresa.dispose();
    cargo.dispose();
    periodo.dispose();
    atividades.dispose();
  }
}

// MODELO DOS CAMPOS DE UMA FORMAÇÃO
class Formacao {
  final curso = TextEditingController();
  final instituicao = TextEditingController();
  final conclusao = TextEditingController();

  String? escolaridade;

  void dispose() {
    curso.dispose();
    instituicao.dispose();
    conclusao.dispose();
  }
}

// MODELO DE UMA HABILIDADE
class Habilidade {
  final nome = TextEditingController();

  void dispose() {
    nome.dispose();
  }
}

// MODELO DE UM IDIOMA
class Idioma {
  final nome = TextEditingController();
  String? nivel;

  void dispose() {
    nome.dispose();
  }
}

// TELA DE CADASTRO
class CadastroCurriculoPage extends StatefulWidget {
  const CadastroCurriculoPage({super.key});

  @override
  State<CadastroCurriculoPage> createState() =>
      _CadastroCurriculoPageState();
}

class _CadastroCurriculoPageState
    extends State<CadastroCurriculoPage> {

  // DADOS PESSOAIS
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final telefoneController = TextEditingController();
  final cidadeController = TextEditingController();

  // OBJETIVO PROFISSIONAL
  final profissaoController = TextEditingController();
  final objetivoController = TextEditingController();
  final resumoController = TextEditingController();

  // LISTAS DINÂMICAS
  final List<Experiencia> experiencias = [];
  final List<Formacao> formacoes = [];
  final List<Habilidade> habilidades = [];
  final List<Idioma> idiomas = [];

  // OPÇÕES DOS DROPDOWNS
  final escolaridades = [
    'Ensino Fundamental',
    'Ensino Médio',
    'Ensino Técnico',
    'Ensino Superior',
    'Pós-graduação',
    'Mestrado',
    'Doutorado',
  ];

  final niveisIdioma = [
    'Básico',
    'Intermediário',
    'Avançado',
    'Fluente',
    'Nativo',
  ];

  // ADICIONAR EXPERIÊNCIA
  void adicionarExperiencia() {
    setState(() {
      experiencias.add(Experiencia());
    });
  }

  // REMOVER EXPERIÊNCIA
  void removerExperiencia(int index) {
    final item = experiencias[index];

    setState(() {
      experiencias.removeAt(index);
    });

    // Libera controladores após atualizar a interface
    WidgetsBinding.instance.addPostFrameCallback((_) {
      item.dispose();
    });
  }

  // ADICIONAR FORMAÇÃO
  void adicionarFormacao() {
    setState(() {
      formacoes.add(Formacao());
    });
  }

  // REMOVER FORMAÇÃO
  void removerFormacao(int index) {
    final item = formacoes[index];

    setState(() {
      formacoes.removeAt(index);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      item.dispose();
    });
  }

  // ADICIONAR HABILIDADE
  void adicionarHabilidade() {
    setState(() {
      habilidades.add(Habilidade());
    });
  }

  // REMOVER HABILIDADE
  void removerHabilidade(int index) {
    final item = habilidades[index];

    setState(() {
      habilidades.removeAt(index);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      item.dispose();
    });
  }

  // ADICIONAR IDIOMA
  void adicionarIdioma() {
    setState(() {
      idiomas.add(Idioma());
    });
  }

  // REMOVER IDIOMA
  void removerIdioma(int index) {
    final item = idiomas[index];

    setState(() {
      idiomas.removeAt(index);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      item.dispose();
    });
  }

  // CAMPO DE TEXTO REUTILIZÁVEL
  Widget campoTexto(
    String titulo,
    TextEditingController controller, {
    int linhas = 1,
    TextInputType teclado = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        maxLines: linhas,
        keyboardType: teclado,
        decoration: InputDecoration(
          labelText: titulo,
          alignLabelWithHint: linhas > 1,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  // TÍTULO DAS SEÇÕES
  Widget tituloSecao(String titulo, IconData icone) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Icon(
            icone,
            color: const Color(0xFF2563EB),
            size: 26,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              titulo,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF182D4B),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // BOTÃO REUTILIZÁVEL PARA ADICIONAR
  Widget botaoAdicionar(String texto, VoidCallback acao) {
    return OutlinedButton.icon(
      onPressed: acao,
      icon: const Icon(Icons.add),
      label: Text(texto),
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 48),
      ),
    );
  }

  // BOTÃO PARA REMOVER UM REGISTRO
  Widget botaoRemover(VoidCallback acao) {
    return IconButton(
      onPressed: acao,
      tooltip: 'Remover registro',
      icon: const Icon(
        Icons.delete_outline,
        color: Colors.red,
      ),
    );
  }

  // FORMULÁRIO DE UMA EXPERIÊNCIA
  Widget formularioExperiencia(
    Experiencia experiencia,
    int index,
  ) {
    return Container(
      key: ObjectKey(experiencia),
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Experiência ${index + 1}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              botaoRemover(
                () => removerExperiencia(index),
              ),
            ],
          ),

          const SizedBox(height: 10),

          campoTexto(
            'Nome da empresa',
            experiencia.empresa,
          ),

          campoTexto(
            'Cargo ocupado',
            experiencia.cargo,
          ),

          campoTexto(
            'Período (Ex: 2022 - 2025)',
            experiencia.periodo,
          ),

          campoTexto(
            'Atividades desenvolvidas',
            experiencia.atividades,
            linhas: 3,
          ),
        ],
      ),
    );
  }

  // FORMULÁRIO DE UMA FORMAÇÃO
  Widget formularioFormacao(
    Formacao formacao,
    int index,
  ) {
    return Container(
      key: ObjectKey(formacao),
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Formação ${index + 1}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              botaoRemover(
                () => removerFormacao(index),
              ),
            ],
          ),

          const SizedBox(height: 10),

          DropdownButtonFormField<String>(
            initialValue: formacao.escolaridade,
            isExpanded: true,
            decoration: const InputDecoration(
              labelText: 'Escolaridade',
              border: OutlineInputBorder(),
            ),
            items: escolaridades.map((opcao) {
              return DropdownMenuItem(
                value: opcao,
                child: Text(opcao),
              );
            }).toList(),
            onChanged: (valor) {
              setState(() {
                formacao.escolaridade = valor;
              });
            },
          ),

          const SizedBox(height: 12),

          campoTexto(
            'Nome do curso',
            formacao.curso,
          ),

          campoTexto(
            'Instituição de ensino',
            formacao.instituicao,
          ),

          campoTexto(
            'Ano de conclusão',
            formacao.conclusao,
            teclado: TextInputType.number,
          ),
        ],
      ),
    );
  }

  // FORMULÁRIO DE UMA HABILIDADE
  Widget formularioHabilidade(
    Habilidade habilidade,
    int index,
  ) {
    return Padding(
      key: ObjectKey(habilidade),
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: campoTexto(
              'Habilidade ${index + 1}',
              habilidade.nome,
            ),
          ),
          botaoRemover(
            () => removerHabilidade(index),
          ),
        ],
      ),
    );
  }

  // FORMULÁRIO DE UM IDIOMA
  Widget formularioIdioma(
    Idioma idioma,
    int index,
  ) {
    return Container(
      key: ObjectKey(idioma),
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Idioma ${index + 1}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              botaoRemover(
                () => removerIdioma(index),
              ),
            ],
          ),

          const SizedBox(height: 10),

          campoTexto(
            'Idioma (Ex: Inglês)',
            idioma.nome,
          ),

          DropdownButtonFormField<String>(
            initialValue: idioma.nivel,
            isExpanded: true,
            decoration: const InputDecoration(
              labelText: 'Nível de conhecimento',
              border: OutlineInputBorder(),
            ),
            items: niveisIdioma.map((nivel) {
              return DropdownMenuItem(
                value: nivel,
                child: Text(nivel),
              );
            }).toList(),
            onChanged: (valor) {
              setState(() {
                idioma.nivel = valor;
              });
            },
          ),
        ],
      ),
    );
  }

  // SIMULA O CADASTRO
  void cadastrarCurriculo() {
    // Os dados ainda não são enviados nem salvos.
    // No futuro, poderão ser enviados para uma API.

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Cadastro simulado! '
          '${experiencias.length} experiência(s), '
          '${formacoes.length} formação(ões), '
          '${habilidades.length} habilidade(s) e '
          '${idiomas.length} idioma(s). '
          'Nenhum dado foi salvo.',
        ),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  // LIMPA TODO O FORMULÁRIO
  void limparFormulario() {
    nomeController.clear();
    emailController.clear();
    telefoneController.clear();
    cidadeController.clear();

    profissaoController.clear();
    objetivoController.clear();
    resumoController.clear();

    // Guarda os itens antes de limpar as listas
    final antigasExperiencias =
        List<Experiencia>.from(experiencias);
    final antigasFormacoes =
        List<Formacao>.from(formacoes);
    final antigasHabilidades =
        List<Habilidade>.from(habilidades);
    final antigosIdiomas =
        List<Idioma>.from(idiomas);

    setState(() {
      experiencias.clear();
      formacoes.clear();
      habilidades.clear();
      idiomas.clear();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (final item in antigasExperiencias) {
        item.dispose();
      }
      for (final item in antigasFormacoes) {
        item.dispose();
      }
      for (final item in antigasHabilidades) {
        item.dispose();
      }
      for (final item in antigosIdiomas) {
        item.dispose();
      }
    });
  }

  // LIBERA OS CONTROLADORES
  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    telefoneController.dispose();
    cidadeController.dispose();

    profissaoController.dispose();
    objetivoController.dispose();
    resumoController.dispose();

    for (final item in experiencias) {
      item.dispose();
    }

    for (final item in formacoes) {
      item.dispose();
    }

    for (final item in habilidades) {
      item.dispose();
    }

    for (final item in idiomas) {
      item.dispose();
    }

    super.dispose();
  }

  // INTERFACE PRINCIPAL
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Currículo'),
        centerTitle: true,
        backgroundColor: const Color(0xFF182D4B),
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 700,
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.stretch,
              children: [

                const Text(
                  'Meu Currículo',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF182D4B),
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  'Preencha seus dados e adicione '
                  'as informações profissionais.',
                ),

                // DADOS PESSOAIS
                tituloSecao(
                  'Dados Pessoais',
                  Icons.person_outline,
                ),

                campoTexto(
                  'Nome completo',
                  nomeController,
                ),

                campoTexto(
                  'E-mail',
                  emailController,
                  teclado: TextInputType.emailAddress,
                ),

                campoTexto(
                  'Telefone',
                  telefoneController,
                  teclado: TextInputType.phone,
                ),

                campoTexto(
                  'Cidade / Estado',
                  cidadeController,
                ),

                // OBJETIVO PROFISSIONAL
                tituloSecao(
                  'Objetivo Profissional',
                  Icons.work_outline,
                ),

                campoTexto(
                  'Profissão ou cargo desejado',
                  profissaoController,
                ),

                campoTexto(
                  'Objetivo profissional',
                  objetivoController,
                  linhas: 3,
                ),

                campoTexto(
                  'Resumo profissional',
                  resumoController,
                  linhas: 4,
                ),

                // EXPERIÊNCIAS DINÂMICAS
                tituloSecao(
                  'Experiência Profissional',
                  Icons.business_center_outlined,
                ),

                ...experiencias.asMap().entries.map(
                  (entrada) => formularioExperiencia(
                    entrada.value,
                    entrada.key,
                  ),
                ),

                botaoAdicionar(
                  'Adicionar Experiência',
                  adicionarExperiencia,
                ),

                // FORMAÇÕES DINÂMICAS
                tituloSecao(
                  'Formação Acadêmica',
                  Icons.school_outlined,
                ),

                ...formacoes.asMap().entries.map(
                  (entrada) => formularioFormacao(
                    entrada.value,
                    entrada.key,
                  ),
                ),

                botaoAdicionar(
                  'Adicionar Formação',
                  adicionarFormacao,
                ),

                // HABILIDADES DINÂMICAS
                tituloSecao(
                  'Habilidades',
                  Icons.code,
                ),

                ...habilidades.asMap().entries.map(
                  (entrada) => formularioHabilidade(
                    entrada.value,
                    entrada.key,
                  ),
                ),

                botaoAdicionar(
                  'Adicionar Habilidade',
                  adicionarHabilidade,
                ),

                // IDIOMAS DINÂMICOS
                tituloSecao(
                  'Idiomas',
                  Icons.language,
                ),

                ...idiomas.asMap().entries.map(
                  (entrada) => formularioIdioma(
                    entrada.value,
                    entrada.key,
                  ),
                ),

                botaoAdicionar(
                  'Adicionar Idioma',
                  adicionarIdioma,
                ),

                const SizedBox(height: 30),

                // BOTÃO CADASTRAR
                SizedBox(
                  height: 55,
                  child: ElevatedButton.icon(
                    onPressed: cadastrarCurriculo,
                    icon: const Icon(Icons.save),
                    label: const Text(
                      'Cadastrar Currículo',
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF2563EB),
                      foregroundColor: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // BOTÃO LIMPAR
                SizedBox(
                  height: 55,
                  child: OutlinedButton.icon(
                    onPressed: limparFormulario,
                    icon: const Icon(
                      Icons.delete_outline,
                    ),
                    label: const Text(
                      'Limpar Formulário',
                    ),
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

