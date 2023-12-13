import 'package:flutter/material.dart';
import 'package:lardocepet/comum/cores.dart';
import 'package:lardocepet/services/autentica_service.dart';
import 'package:lardocepet/telas/login_tela.dart';

class PerfilTela extends StatefulWidget {
  const PerfilTela({super.key});

  @override
  State<PerfilTela> createState() => _PerfilTelaState();
}

class _PerfilTelaState extends State<PerfilTela> {
  Color cordfundo = Color.fromARGB(255, 215, 241, 237);

  String cpf = '123.456.789-00';
  String endereco = 'Rua Exemplo, 123';
  String tempoPerfil = '1 ano'; // Você pode ajustar conforme necessário

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: azul_escuro,
          title: const Text('Perfil',style: TextStyle(color: Colors.white),),
        ),
        body: Container(
          color: cordfundo,
          child: Row(
            children: [
              _buildOpcoesPerfil(),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildConfigurarPerfilTab(),
                    _buildVerConquistasTab(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOpcoesPerfil() {
    return Container(
      width: 350,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(color: Colors.grey),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('lib/imagens/cachorro.png'),
          ),
          const SizedBox(height: 16),
          const Text(
            'Nome do Usuário',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'email@example.com',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 16,),
          _buildOpcoesBotoes(),
        ],
      ),
    );
  }

  Widget _buildOpcoesBotoes() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: InkWell(
            onTap: () {
              // Lógica para a ação do botão "Configurar Perfil"
            },
            child:  Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.visibility), // Adicionando o ícone
                  SizedBox(width: 8), // Adicionando espaço entre o ícone e o texto
                  Text(
                    'Ver Perfil',
                    style: TextStyle(
                      fontSize: 18,
                    ), 
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: InkWell(
            onTap: () {
              // Lógica para a ação do botão "Configurar Perfil"
            },
            child:  Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.settings), // Adicionando o ícone
                  SizedBox(width: 8), // Adicionando espaço entre o ícone e o texto
                  Text(
                    'Configurar Perfil',
                    style: TextStyle(
                      fontSize: 18,
                    ), 
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: InkWell(
            onTap: () {
              // Lógica para a ação do botão "Ver Conquistas"
            },
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.star), // Adicionando o ícone
                  SizedBox(width: 8), // Adicionando espaço entre o ícone e o texto
                  Text(
                    'Ver Conquistas',
                    style: TextStyle(
                      fontSize: 18,
                    ), 
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        Card(
          elevation: 5,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          color: Color.fromARGB(255,241, 88, 61),
          child: InkWell(
            onTap: () {
              // Lógica para a ação do botão "Sair"
              AutenticaService().deslogarUsuario();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
            },
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.exit_to_app, color: Colors.black), // Adicionando o ícone
                  SizedBox(width: 8), // Adicionando espaço entre o ícone e o texto
                  Text(
                    'Sair',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                    ), 
                  ),
                ],
              ),
            ),
          ),
        ),
        ],
      ),
    );
  }

  Widget _buildConfigurarPerfilTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Telefone de Contato',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            '+55 123 456 789',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 16),
          Text(
            'Biografia',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Text(
            'CPF',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '$cpf',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Text(
            'Endereço',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '$endereco',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          Text(
            'Tempo de Perfil',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            '$tempoPerfil',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildVerConquistasTab() {
    return const Center(
      child: Text('Conquistas serão exibidas aqui.'),
    );
  }
}
