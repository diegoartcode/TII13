
import 'package:flutter/material.dart';

// Função principal da aplicação
void main() {
  runApp(const MyApp());
}

// Widget principal
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Remove a faixa de DEBUG
      debugShowCheckedModeBanner: false,

      title: 'Meu Currículo',

      // Define o tema da aplicação
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
      ),

      // Define a tela inicial
      home: const CurriculoPage(),
    );
  }
}

// Tela do currículo
class CurriculoPage extends StatelessWidget {
  const CurriculoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior
      appBar: AppBar(
        title: const Text('Meu Currículo'),
        centerTitle: true,
        backgroundColor: const Color(0xFF182D4B),
        foregroundColor: Colors.white,
      ),

      // Permite rolar o currículo verticalmente
      body: SingleChildScrollView(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 650,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // CABEÇALHO DO CURRÍCULO
                Container(
                  padding: const EdgeInsets.all(30),
                  color: const Color(0xFF182D4B),

                  child: Column(
                    children: [
                      // Foto de perfil ilustrativa
                      const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.person,
                          size: 65,
                          color: Color(0xFF182D4B),
                        ),
                      ),

                      const SizedBox(height: 15),

                      // Nome
                      const Text(
                        'Diego Rodrigues',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 5),

                      // Profissão
                      const Text(
                        'Desenvolvedora Flutter',
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white70,
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Informações de contato
                      const Text(
                        'São Paulo - SP',
                        style: TextStyle(color: Colors.white),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        'diego@email.com',
                        style: TextStyle(color: Colors.white),
                      ),

                      const SizedBox(height: 5),

                      const Text(
                        '(11) 99999-9999',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),

                // CONTEÚDO DO CURRÍCULO
                Padding(
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // SOBRE MIM
                      tituloSecao(
                        Icons.person_outline,
                        'Sobre mim',
                      ),

                      const Text(
                        'Sou desenvolvedor apaixonado por '
                        'tecnologia e desenvolvimento de '
                        'aplicativos. Busco criar soluções '
                        'modernas e funcionais.',
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.5,
                        ),
                      ),

                      const SizedBox(height: 25),

                      // EXPERIÊNCIA
                      tituloSecao(
                        Icons.work_outline,
                        'Experiência Profissional',
                      ),

                      const Text(
                        'Desenvolvedora Mobile',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Text(
                        'Tech Solutions | 2023 - Atual',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Desenvolvimento de interfaces '
                        'e aplicativos utilizando Flutter '
                        'e linguagem Dart.',
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        'Desenvolvedora Web',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Text(
                        'Solutions Tech | 2022 - 2023',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        'Desenvolvimento de interfaces '
                        'para aplicações web.',
                      ),

                      const SizedBox(height: 25),

                      // FORMAÇÃO
                      tituloSecao(
                        Icons.school_outlined,
                        'Formação Acadêmica',
                      ),

                      const Text(
                        'Análise e Desenvolvimento de Sistemas',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Text(
                        'Faculdade de Tecnologia | 2022 - 2024',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 25),

                      // HABILIDADES
                      tituloSecao(
                        Icons.code,
                        'Habilidades',
                      ),

                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: const [
                          Chip(label: Text('Flutter')),
                          Chip(label: Text('Dart')),
                          Chip(label: Text('Python')),
                          Chip(label: Text('HTML')),
                          Chip(label: Text('CSS')),
                          Chip(label: Text('Git')),
                        ],
                      ),

                      const SizedBox(height: 25),

                      // IDIOMAS
                      tituloSecao(
                        Icons.language,
                        'Idiomas',
                      ),

                      const Text('Português - Nativo'),
                      const SizedBox(height: 5),
                      const Text('Inglês - Intermediário'),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método reutilizável para criar títulos das seções
  Widget tituloSecao(IconData icone, String titulo) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        children: [
          Icon(
            icone,
            color: const Color(0xFF2563EB),
            size: 25,
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
}
