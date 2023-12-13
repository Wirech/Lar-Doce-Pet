import 'package:flutter/material.dart';
import 'package:lardocepet/comum/cores.dart';
import 'package:lardocepet/telas/login_tela.dart';

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: azul_escuro,
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
              // Adicionar ação para o botão "Início"
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            style: TextButton.styleFrom(
                primary: Colors.white, padding: const EdgeInsets.fromLTRB(30, 10, 30, 10)),
            child: const Text(
              'Início',
              textScaleFactor: 1.5,
            ),
          ),
          // Botão "Sobre"
          TextButton(
            onPressed: () {
              // Adicionar ação para o botão "Sobre"
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Sobre(),));
            },
            style: TextButton.styleFrom(
                primary: Colors.white, padding: const EdgeInsets.fromLTRB(30, 10, 30, 10)),
            child: const Text(
              'Sobre',
              textScaleFactor: 1.5,
            ),
          ),
        ],
      ),





      body: Container(
        color: verde_escuro,
        
        child:Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0,3),
              )
            ]
          ),
        


        child: Row(
          
          children: [
            // Metade esquerda
            Expanded(
              
              child: Container(
                color: Colors.transparent,
                padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.1,
                MediaQuery.of(context).size.height * 0.1,
                MediaQuery.of(context).size.width * 0,
                MediaQuery.of(context).size.height * 0.1,
              ),
                child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Column(
      crossAxisAlignment: CrossAxisAlignment.start  ,
      children: [
        Text(
          'SOBRE NÓS',
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.07,
          height: 6.0,
          color:  verde_claro,
          margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0,
                MediaQuery.of(context).size.height * 0.04,
                MediaQuery.of(context).size.width * 0,
                MediaQuery.of(context).size.height * 0.05,
              ),

        ),
      ],
    ),
    SizedBox(height: 10), // Ajuste a altura conforme necessário
    Text(
      'O Lar Doce Pet é uma plataforma desenvolvida por alunos do CEFET-MG campus V, com o objetivo de reduzir a quantidade de cães e gatos nas ruas. Através de uma pesquisa realizada pela UFSJ, constatou-se que em Divinópolis, MG, existem cerca de 12 mil cachorros abandonados. O site funciona como uma ferramenta para conectar esses animais com possíveis lares, auxiliando também ONGs locais e protetores independentes. Além de facilitar a adoção, o Lar Doce Pet busca conscientizar sobre a guarda responsável e promover medidas para garantir o bem-estar dos animais. A equipe está empenhada em promover mudanças positivas na realidade dos animais de rua, convidando a população a se unir nessa causa. ',
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    ),
  ],
),


              ),
            ),
            // Metade direita
            Expanded(
              child: Padding(
              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.1,
                MediaQuery.of(context).size.height * 0.1,
                MediaQuery.of(context).size.width * 0.1,
                MediaQuery.of(context).size.height * 0.1,
              ),
        child: Container(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(80, 0, 0, 0),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0,3),
              )
            ],
          image: DecorationImage(
            image: AssetImage('lib/imagens/cachorro2.png'),
            fit: BoxFit.cover,
          ),
          ),

          
        width: MediaQuery.of(context).size.width*1,
        
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
//#0b5a30 verde
//#333 azul