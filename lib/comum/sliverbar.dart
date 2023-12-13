import 'package:flutter/material.dart';
import 'package:lardocepet/comum/cores.dart';
import 'package:lardocepet/telas/animais_tela.dart';
import 'package:lardocepet/telas/cadastre_tela.dart';
import 'package:lardocepet/telas/inicio_tela.dart';
import 'package:lardocepet/telas/noticias_tela.dart';
import 'package:lardocepet/telas/perfil_tela.dart';


class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return AppBar(
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
              Navigator.push(context, MaterialPageRoute(builder: (context) => const InicioTela(),));
            },
            style: TextButton.styleFrom(
                primary: Colors.white, padding: const EdgeInsets.fromLTRB(30, 10, 30, 10)),
            child: const Text(
              'Início',
              textScaleFactor: 1.5,
            ),
          ),
          // Botão caesegatos
          TextButton(
            onPressed: () {
              // Adicionar ação para o botão "Sobre"
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AnimaisTela(),));
            },
            style: TextButton.styleFrom(
                primary: Colors.white, padding: const EdgeInsets.fromLTRB(30, 10, 30, 10)),
            child: const Text(
              'Cães E Gatos',
              textScaleFactor: 1.5,
            ),
          ),
          // Botão Cadastre
          TextButton(
            onPressed: () {
              // Adicionar ação para o botão "Sobre"
              Navigator.push(context, MaterialPageRoute(builder: (context) => CadastreTela(),));
            },
            style: TextButton.styleFrom(
                primary: Colors.white, padding: const EdgeInsets.fromLTRB(30, 10, 30, 10)),
            child: const Text(
              'Cadastre',
              textScaleFactor: 1.5,
            ),
          ),
          // Botão Notícias
          TextButton(
            onPressed: () {
              // Adicionar ação para o botão "Sobre"
              Navigator.push(context, MaterialPageRoute(builder: (context) => const NoticiasTela(),));
            },
            style: TextButton.styleFrom(
                primary: Colors.white, padding: const EdgeInsets.fromLTRB(30, 10, 30, 10)),
            child: const Text(
              'Notícias',
              textScaleFactor: 1.5,
            ),
          ),
          IconButton(
            onPressed: () {
            // Adicionar ação para o botão "Perfil"
            Navigator.push(context, MaterialPageRoute(builder: (context) => const PerfilTela(),));
            },
            icon: const Icon(
              Icons.person,
              size: 30,  // Ajuste o tamanho do ícone conforme necessário
              color: Colors.white,
    
            ),
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          ),
        ],
    );
  }

  @override
  double get maxExtent => 100.0;

  @override
  double get minExtent => 100.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}