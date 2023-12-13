import 'package:flutter/material.dart';
import 'package:lardocepet/comum/cores.dart';
import 'package:lardocepet/comum/noticiacard.dart';
import 'package:lardocepet/comum/sliverbar.dart';

class NoticiasTela extends StatefulWidget {
  const NoticiasTela({super.key});

  @override
  State<NoticiasTela> createState() => _NoticiasTelaState();
}

class _NoticiasTelaState extends State<NoticiasTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: azul_escuro,
        ),
        child: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: false,
            delegate: CustomSliverAppBarDelegate(),
          ),
          SliverToBoxAdapter(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
              ),
              child: Column(
                children: [

                
              Text(
                'Notícias',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontFamily: 'Merriweather',
                  height: 2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.07,
                height: 4.0,
                color:  verde_claro,
                  margin: EdgeInsets.fromLTRB(
                  MediaQuery.of(context).size.width * 0,
                  MediaQuery.of(context).size.height * 0.04,
                  MediaQuery.of(context).size.width * 0,
                  MediaQuery.of(context).size.height * 0.05,
                ),
              ),
              ]
              )
            ),
          ),
          // Add more Slivers for additional content below
          SliverList(
            
  delegate: SliverChildBuilderDelegate(
    (BuildContext context, int index) {
      // Adicione o conteúdo da lista aqui, por exemplo, cards de notícias
      return NoticiaCard(
        titulo: 'Título da Notícia $index',
        descricao: 'Descrição da Notícia $index',
      );
    },
    childCount: 8, // Número de cards de notícias
    
  ),
),

        ],
      ),
      ),
      
      








    );
  }









}