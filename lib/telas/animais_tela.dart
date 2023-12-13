import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lardocepet/comum/animalcard.dart';
import 'package:lardocepet/comum/cores.dart';
import 'package:lardocepet/firestore/models/animal.dart';
import 'package:lardocepet/telas/cadastre_tela.dart';
import 'package:lardocepet/telas/detalhe_animal.dart';
import 'package:lardocepet/telas/inicio_tela.dart';
import 'package:lardocepet/telas/noticias_tela.dart';
import 'package:lardocepet/telas/perfil_tela.dart';

class AnimaisTela extends StatefulWidget {
  const AnimaisTela({super.key});

  @override
  State<AnimaisTela> createState() => _AnimaisTelaState();
}

class _AnimaisTelaState extends State<AnimaisTela> {
  Color cordefundo = azul_escuro;

  // Adicione variáveis de estado para controlar os valores selecionados
  String selectedSexo = "Todos";
  String selectedTamanho = "Todos";
  String selectedEspecie = "Todos";
  String selectedCor = "Todos";

  // Listas de opções para cada filtro
  List<String> sexos = ["Todos", "Macho", "Fêmea"];
  List<String> tamanhos = ["Todos", "Pequeno", "Médio", "Grande"];
  List<String> especies = ["Todos", "Cão", "Gato"];
  List<String> cores = ["Todos", "Branco", "Preto", "Marrom"];


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
      ),



    body: Container(
          color: cordefundo, // cor "azul_escuro"
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              
              Column(

                children: [
                  Text(
                "Cães e Gatos",
                style: TextStyle(
                  fontFamily: 'Merriweather',
                  fontSize: 36,
                  color: Colors.white,
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
                              MediaQuery.of(context).size.height * 0,
                            ),
                          ),
                ],
              ),
               // Espaço superior
              
              SizedBox(height: 20), // Espaço entre o texto e a divisão
              Expanded(
                child: Row(
                  children: [
                    // Parte esquerda (30%)
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: cordefundo,
                          border: Border(
                            right: BorderSide(
                              color: Colors.white,
                              width: 2,
                            )
                          )
                        ),
                        
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                              "Filtros  ",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: verde_claro
                              ),
                            ),
                            Icon(
                              Icons.search,
                              color: verde_claro,
                              size: 30,
                            ),
                            ],
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


                            SizedBox(height: 10),



                            
            buildCategoryBox("Sexo", sexos, selectedSexo, (value) {
              setState(() {
                selectedSexo = value;
              });
            }),
            buildCategoryBox("Tamanho", tamanhos, selectedTamanho, (value) {
              setState(() {
                selectedTamanho = value;
              });
            }),
            buildCategoryBox("Espécie", especies, selectedEspecie, (value) {
              setState(() {
                selectedEspecie = value;
              });
            }),
            buildCategoryBox("Cor", cores, selectedCor, (value) {
              setState(() {
                selectedCor = value;
              });
            }),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                MaterialStatePropertyAll(Color.fromARGB(255, 71, 150, 66)),
                fixedSize: MaterialStatePropertyAll(
                  Size(
                    MediaQuery.of(context).size.width * 0.1,
                    MediaQuery.of(context).size.width * 0.03,
                  ),
                ),
              ),
              onPressed: () async{

                await buscarAnimais();
                _aplicarFiltros();

              },
              child: Text(
                "Aplicar Filtros",
                style: TextStyle(
                  color: azul_escuro,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,

                ),
                ),
            ),
                          ],
                        ),
                      ),
                    ),
                    // Parte direita (70%)
                    Expanded(
                      flex: 7,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.025,
                MediaQuery.of(context).size.height * 0,
                MediaQuery.of(context).size.width * 0.025,
                MediaQuery.of(context).size.height * 0,
              ),
                        decoration: BoxDecoration(
                          color: cordefundo,
                          border: Border(
                            /*top: BorderSide(
                              color: Colors.white,
                              width: 2,
                            )*/
                          )
                        ),
                        
                        // Adicione aqui a lógica para mostrar os cards do banco de dados
                        // Exemplo: buildDatabaseCards(),
                        
                        child: buildAnimalGrid(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),


        
    );
  }











  // Função para criar caixa de categoria
Widget buildCategoryBox(String title, List<String> options, String selectedValue, void Function(String) onChanged) {
  double boxWidth = MediaQuery.of(context).size.width * 0.2;
  double boxHeight = MediaQuery.of(context).size.height * 0.1;

  return SizedBox(
    width: boxWidth,
    height: boxHeight,
    child: DropdownButtonFormField<String>(
      value: selectedValue,
      onChanged: (String? value) {
        if (value != null) {
          onChanged(value);
        }
      },
      items: options.map((String opcao) {
        return DropdownMenuItem<String>(
          value: opcao,
          child: Text(
            opcao,
            style: TextStyle(
              color: verde_escuro2,
            ),
          ),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: title,
        fillColor: verde_claro,
        filled: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 10.0,
        ),
      ),
    ),
  );
}














  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  List<Animal> animais = [];

  Future<void> buscarAnimais() async {
    try {
      List<Animal> temp = [];

      QuerySnapshot<Map<String, dynamic>> snapshot =
        await _firestore.collection("animal").get();

      //print("teste: ${snapshot.docs}");
      for(var doc in snapshot.docs){
        temp.add(Animal.fromMap(doc.data()));
      }
      //print("object:${temp.length},${temp}");
      setState(() {
        animais = temp;
        //print("animal:${animais.length},${animais}");
      });
    } catch (e) {
      print("Erro ao buscar animais: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    buscarAnimais();
  }

  Widget buildAnimalGrid(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: MediaQuery.of(context).size.width * 0.015,
        mainAxisSpacing: MediaQuery.of(context).size.width * 0.016,
        childAspectRatio: 1.2,
      ),
      itemCount: animais.length,
      itemBuilder: (context, index) {
        //buscarAnimais();
        //print("animalincode:${animais.length},${animais[index]}");


        Animal animal = animais[index];
        return AnimalCard(
          animal: animal,
          onPressed: (){
            Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetalhesAnimalTela(animal: animal),
    ),
  );
          },
          );

      },
    );
  }


    void _onAnimalCardPressed(BuildContext context, Animal animal) {
  // Navegar para a próxima página e passar o contexto do animal
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetalhesAnimalTela(animal: animal),
    ),
  );
}



void _aplicarFiltros() {
  // Filtre os animais com base nos critérios selecionados
  
  List<Animal> animaisFiltrados = [];

  for (Animal animal in animais) {
    bool atendeFiltros = true;

    // Aplica os filtros
    if (selectedSexo != "Todos" && animal.sexo != selectedSexo) {
      atendeFiltros = false;
    }

    if (selectedTamanho != "Todos" && animal.tamanho != selectedTamanho) {
      atendeFiltros = false;
    }

    if (selectedEspecie != "Todos" && animal.especie != selectedEspecie) {
      atendeFiltros = false;
    }

    if (selectedCor != "Todos" && animal.cor != selectedCor) {
      atendeFiltros = false;
    }

    // Adiciona à lista de animais filtrados se atender aos critérios
    if (atendeFiltros) {
      animaisFiltrados.add(animal);
    }
  }
  // Atualiza o estado com a nova lista de animais filtrados
  setState(() {
    animais = animaisFiltrados;
  });
}


}


