import 'package:flutter/material.dart';
import 'package:lardocepet/comum/cores.dart';

class NoticiaCard extends StatelessWidget {
  final String titulo;
  final String descricao;

  NoticiaCard({
    required this.titulo,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black87,
      shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(3)),
      elevation: 4.0,
      margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.1,
                MediaQuery.of(context).size.height * 0,
                MediaQuery.of(context).size.width * 0.1,
                MediaQuery.of(context).size.height * 0.05,
              ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0,
                MediaQuery.of(context).size.height * 0,
                MediaQuery.of(context).size.width * 0,
                MediaQuery.of(context).size.height * 0,
              ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.02,
                MediaQuery.of(context).size.height * 0.02,
                MediaQuery.of(context).size.width * 0.0175,
                MediaQuery.of(context).size.height * 0.02,
              ),
              width:MediaQuery.of(context).size.width * 0.150,
              height: MediaQuery.of(context).size.width * 0.125,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/imagens/gato.png'),
                  fit: BoxFit.cover,
                  ),
              ),
              child: Positioned(
                
                child: Container(
                  margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.01,
                MediaQuery.of(context).size.height * 0.015,
                MediaQuery.of(context).size.width * 0.09,
                MediaQuery.of(context).size.height * 0.12,
              ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                  ),
                  child: Column(
                    children: [
                      Text(
                        '30',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 30,
                          height: 1.5
                        ),
                      ),
                      Text(
                        'Nov',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 15,
                          height: 1.5
                        ),
                        )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width *0.6,
              margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0,
                MediaQuery.of(context).size.height * 0.02,
                MediaQuery.of(context).size.width * 0,
                MediaQuery.of(context).size.height * 0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  'CASTRAÇÃO GRATUITA',
                  style: TextStyle(
                    color: verde_claro,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                const Text(
                  '22/10/2021 20:00 / Divinópolis, MG, Brasil',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 10),
                const Text(
                  'A Prefeitura abre a agenda de castração no Crevisa pelo App Divinópolis todo primeiro dia útil do mês. Quem quiser garantir vaga para realizar o procedimento cirúrgico pelo aplicativo deve clicar no menu “Serviços”, item “Castração”, subitem “Solicitar Castração”, e inscrever o animal. A função cria canal adicional para que a população acesse o serviço. O objetivo é facilitar a vida ao cidadão divinopolitano na hora de esterilizar o animal doméstico.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    height: 1.25,
                  ),
                  maxLines: 4,
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(verde_claro),

                  ),
                  onPressed: () {
                    
                  },
                  child: Text(
                    'Ler mais',
                    style: TextStyle(
                      color: verde_escuro,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
                ]
                  
                ),
            ),

            
          ],
        ),
      ),
    );
  }
}
