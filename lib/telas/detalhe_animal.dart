import 'package:flutter/material.dart';
import 'package:lardocepet/comum/cores.dart';
import 'package:lardocepet/firestore/models/animal.dart';

class DetalhesAnimalTela extends StatelessWidget {
  final Animal animal;
  const DetalhesAnimalTela({super.key,required this.animal});
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: azul_escuro,
          title: const Text('Detalhes do Animal',style: TextStyle(color: Colors.white),),
        ),
      body: Container(
        color: Color.fromARGB(255, 215, 241, 237),
        child:       Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Exibição de informações sobre o animal
            Container(
              height: MediaQuery.of(context).size.height * 0.55, // Altura da seção de informações (ajuste conforme necessário)
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  animal.url,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 14),
            Text(
              "Especie: ${animal.especie}",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Cor: ${animal.cor}",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Local: ${animal.local}",
              style: TextStyle(fontSize: 18),
            ),
            // Mais informações podem ser adicionadas conforme necessário

            // Espaçamento entre informações e botões
            SizedBox(height: 16),

            // Botões

            Container(
              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.4,
                MediaQuery.of(context).size.width * 0,
                MediaQuery.of(context).size.width * 0.4,
                MediaQuery.of(context).size.width * 0.01
                ),
              child:  ElevatedButton(

                child: Text("Adotar",style: TextStyle(
                      fontSize: 18,
                      color: azul_escuro,
                    ),),
                onPressed: (){

                },
              ),

            ),
                        Container(
              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.4,
                MediaQuery.of(context).size.width * 0,
                MediaQuery.of(context).size.width * 0.4,
                MediaQuery.of(context).size.width * 0.01
                ),
              child:  ElevatedButton(
                child: Text("Acolher",style: TextStyle(
                      fontSize: 18,
                      color: azul_escuro,
                    ),),
                onPressed: (){

                },
              ),

            ),
                        Container(
              padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.4,
                MediaQuery.of(context).size.width * 0,
                MediaQuery.of(context).size.width * 0.4,
                MediaQuery.of(context).size.width * 0
                ),
              child:  ElevatedButton(
                child: Text("Compartilhar",style: TextStyle(
                      fontSize: 18,
                      color: azul_escuro,
                    ),),
                onPressed: (){

                },
              ),

            ),

          ],
        ),
      ),
      )
      

    );
  }
}