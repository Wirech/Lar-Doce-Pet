import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lardocepet/comum/meu_snackbar.dart';
import 'package:lardocepet/firestore/models/ajudante.dart';
import 'package:lardocepet/services/autentica_service.dart';
import 'package:lardocepet/telas/inicio_tela.dart';
import 'package:lardocepet/telas/sobre_tela.dart';
import 'package:uuid/uuid.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _wantToLogin = true; // true for login, false for registration
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  AutenticaService _autenService = AutenticaService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        flexibleSpace: Container(
          alignment: AlignmentDirectional.centerStart,
          padding: const EdgeInsets.all(20),
          child: Image.network('lib/imagens/logo.png'),
        ),
        actions: [
          // Botão "Início"
          TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage(),));
            },
            style: TextButton.styleFrom(
                primary: Colors.white, padding: const EdgeInsets.fromLTRB(40, 10, 40, 10)),
            child: const Text(
              'Início',
              textScaleFactor: 1.5,
            ),
          ),
          // Botão "Sobre"
          TextButton(
            onPressed: () {
              // Adicionar ação para o botão "Sobre"
              Navigator.push(context, MaterialPageRoute(builder: (context) => Sobre(),));
            },
            style: TextButton.styleFrom(
                primary: Colors.white, padding: const EdgeInsets.fromLTRB(40, 10, 40, 10)),
            child: const Text(
              'Sobre',
              textScaleFactor: 1.5,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/imagens/cachorro.png'),
            fit: BoxFit.cover,
          ),
        ),
        child:Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0,3),
              )
            ]
          ),
        


        child: Row(
          
          children: [
            // Metade esquerda
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.15,
                MediaQuery.of(context).size.height * 0.25,
                MediaQuery.of(context).size.width * 0,
                MediaQuery.of(context).size.height * 0,
              ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lar Doce Pet',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Merriweather',
                        height: 4,
                        color: Color.fromARGB(255, 155, 242, 196),
                        ),
                    ),
                    Text(
                      'Ajude uma vida hoje.',
                      style: TextStyle(fontSize: 18,fontFamily: 'Merriweather', color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            // Metade direita
            Expanded(
              child: Padding(
              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.13,
                MediaQuery.of(context).size.height * 0.22,
                MediaQuery.of(context).size.width * 0.13,
                MediaQuery.of(context).size.height * 0.20,
              ),
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(16.0),
          ),
        width: MediaQuery.of(context).size.width*0.5,
        child:Padding(
          padding: const EdgeInsets.all(16.0),

        
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_wantToLogin?'Entrar':'Cadastre-se',
              
              style: TextStyle(
                fontSize: 38,
                color: Colors.green,
              ),
              ),
                if (!_wantToLogin)
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    icon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira um nome válido';
                    }
                    return null;
                  },
                ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  icon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira um e-mail válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  icon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira uma senha válida';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (_wantToLogin) {
                      // Faça o processamento de login aqui
                      String email = _emailController.text;
                      String senha = _passwordController.text;

                      // Exemplo simples de como lidar com os dados
                      print('Email: $email');
                      print('Senha: $senha');




                      _autenService.logarUsuario(
                        email: email,
                        senha: senha,
                      ).then(
                          (String? erro) {
                            if(erro != null){
                              showSnackbar(context: context,
                              texto: erro);
                            }
                            else{
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => InicioTela(),),
                                );
                            }
                        });
                    } else {
                      // Faça o processamento de registro aqui
                      String nome = _nameController.text;
                      String email = _emailController.text;
                      String senha = _passwordController.text;

                      // Exemplo simples de como lidar com os dados
                      print('Nome: $nome');
                      print('Email: $email');
                      print('Senha: $senha');


                      Ajudante ajudante = Ajudante(id: const Uuid().v1(), nome: nome, email: email);

                      _autenService.cadastrarUsuario(
                        nome: nome,
                        senha: senha,
                        email: email,
                        ).then(
                          (String? erro) {
                            if(erro != null){
                              showSnackbar(context: context,
                              texto: erro);
                            }
                            else {
                              firebase.collection("ajudante").doc(ajudante.id).set(ajudante.toMap());
                              MaterialPageRoute(builder: (context) => const InicioTela(),);
                            }
                        });
                    }
                  }
                },
                child: Text(_wantToLogin ? 'Entrar' : 'Cadastrar'),
              ),
              SizedBox(height: 10.0),
              TextButton(
                onPressed: () {
                  setState(() {
                    _wantToLogin = !_wantToLogin;
                  });
                },
                child: Text(_wantToLogin ? 'Ainda não possui uma conta? | Cadastrar' : 'Já possui uma conta? | Entrar'),
              ),
            ],
          ),
        ),
        )
        )
      ),

            ),
          ],
        ),
      )
      ),
    );
  }
}
