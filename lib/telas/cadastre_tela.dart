import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lardocepet/comum/cores.dart';
import 'package:lardocepet/comum/meu_snackbar.dart';
import 'package:lardocepet/comum/sliverbar.dart';
import 'package:lardocepet/firestore/models/animal.dart';
import 'package:uuid/uuid.dart';

class CadastreTela extends StatefulWidget {
  const CadastreTela({super.key});

  @override
  State<CadastreTela> createState() => _CadastreTelaState();
}

class _CadastreTelaState extends State<CadastreTela> {
  final storage = FirebaseStorage.instance;
  final storageRef = FirebaseStorage.instance.ref();
  late String foto;

  XFile? file;
  String? temp;
  Color cor = Color.fromARGB(255, 71, 150, 66);
  double tamanho = 0.5;
  TextEditingController sexoController = TextEditingController();
  TextEditingController especieController = TextEditingController();
  TextEditingController corController = TextEditingController();
  TextEditingController tamanhoController = TextEditingController();
  TextEditingController fotoController = TextEditingController();
  TextEditingController localizacaoController = TextEditingController();
  Color cordefundo = Color.fromARGB(255, 155, 197, 159);

  FirebaseFirestore firebase = FirebaseFirestore.instance;

    List<String> opcoesSexo = ['Macho', 'Fêmea'];
    String? selectedSexo;
    List<String> opcoesEspecie = ['Cão', 'Gato'];
    String? selectedEspecie;
    List<String> opcoesTamanho = ['Pequeno', 'Médio', 'Grande'];
    String? selectedTamanho;
    List<String> opcoesCor = ['Branco', 'Preto', 'Marrom', 'Laranja', 'Cinza'];
    String? selectedCor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 155, 197, 159),
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
                decoration: BoxDecoration(),
                child: Column(
                  children: [
                    Text(
                      'Cadastre',
                      style: TextStyle(
                        fontSize: 36,
                        fontFamily: 'Merriweather',
                        color: azul_escuro,
                        height: 2,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.07,
                      height: 4.0,
                      color: verde_claro,
                      margin: EdgeInsets.fromLTRB(
                        MediaQuery.of(context).size.width * 0,
                        MediaQuery.of(context).size.height * 0.04,
                        MediaQuery.of(context).size.width * 0,
                        MediaQuery.of(context).size.height * 0.05,
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Movendo o conteúdo do _buildForm diretamente aqui
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.pets,
                                        color: azul_escuro,
                                        size: 30,
                                      ),
                                      Text(
                                        "   Informações do Animal   ",
                                        style: TextStyle(
                                          fontSize: 26,
                                          fontWeight: FontWeight.bold,
                                          color: azul_escuro,
                                        ),
                                      ),
                                      Icon(
                                        Icons.pets,
                                        color: azul_escuro,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 20),
      SizedBox(
        width: MediaQuery.of(context).size.width * tamanho,
        child: DropdownButtonFormField<String>(
          value: selectedSexo,
          onChanged: (String? value) {
            setState(() {
              selectedSexo = value;
            });
          },
          items: opcoesSexo.map((String opcao) {
            return DropdownMenuItem<String>(
              value: opcao,
              child: Text(opcao),
            );
          }).toList(),
          decoration: InputDecoration(
            labelText: 'Sexo',
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
          ),
        ),
      ),
                                    SizedBox(height: 10),
      SizedBox(
        width: MediaQuery.of(context).size.width * tamanho,
        child: DropdownButtonFormField<String>(
          value: selectedEspecie,
          onChanged: (String? value) {
            setState(() {
              selectedEspecie = value;
            });
          },
          items: opcoesEspecie.map((String opcao) {
            return DropdownMenuItem<String>(
              value: opcao,
              child: Text(opcao),
            );
          }).toList(),
          decoration: InputDecoration(
            labelText: 'Espécie',
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
          ),
        ),
      ),
                                    SizedBox(height: 10),
      SizedBox(
        width: MediaQuery.of(context).size.width * tamanho,
        child: DropdownButtonFormField<String>(
          value: selectedTamanho,
          onChanged: (String? value) {
            setState(() {
              selectedTamanho = value;
            });
          },
          items: opcoesTamanho.map((String opcao) {
            return DropdownMenuItem<String>(
              value: opcao,
              child: Text(opcao),
            );
          }).toList(),
          decoration: InputDecoration(
            labelText: 'Tamanho',
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
          ),
        ),
      ),
                                    SizedBox(height: 10),
      SizedBox(
        width: MediaQuery.of(context).size.width * tamanho,
        child: DropdownButtonFormField<String>(
          value: selectedCor,
          onChanged: (String? value) {
            setState(() {
              selectedCor = value;
            });
          },
          items: opcoesCor.map((String opcao) {
            return DropdownMenuItem<String>(
              value: opcao,
              child: Text(opcao),
            );
          }).toList(),
          decoration: InputDecoration(
            labelText: 'Cor',
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
          ),
        ),
      ),
                                    SizedBox(height: 10),
                                                                        SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width *
                                              tamanho,
                                      child: TextFormField(
                                        controller: localizacaoController,
                                        decoration: InputDecoration(
                                          labelText: 'Local de avistamento',
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 10.0,
                                            horizontal: 10.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width *
                                              tamanho,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStatePropertyAll(verde_escuro),
                                        ),
                                        onPressed: () async {
                                        print("Arquivo antes:${file}");
                                        file = await getImageFromGallery();
                                        print("Arquivo depois:${file},${file!.name},${file!.path}");
                                        setState(() {
                                          
                                        });
                                        
                                        },
                                        child: Text(
                                          file!=null?
                                          'Imagem: ${file!.name}':
                                          'Selecione uma imagem'
                                          ,
                                          style: TextStyle(
                                            color: verde_claro,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    ElevatedButton(
                                      style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(cor),
                                        fixedSize: MaterialStatePropertyAll(
                                          Size(
                                            MediaQuery.of(context).size.width *
                                                tamanho,
                                            MediaQuery.of(context).size.width *
                                                0.03,
                                          ),
                                        ),
                                      ),
                                      onPressed: () async {
                                        
                                        uploadImage(file!.path, "teste");
                                        
                                        if(selectedEspecie=="Cão"&&selectedTamanho=="Grande"&&selectedCor=="Marrom"){
                                          temp="lib/imagens/cao_grande_marrom.jpeg";
                                        }
                                        else if(selectedEspecie=="Cão"&&selectedTamanho=="Médio"&&selectedCor=="Branco"){
                                          temp="lib/imagens/cao_medio_branco.jpg";
                                        }
                                        else if(selectedEspecie=="Cão"&&selectedTamanho=="Pequeno"&&selectedCor=="Preto"){
                                          temp="lib/imagens/cao_pequeno_preto.jpeg";
                                        }
                                        else if(selectedEspecie=="Gato"&&selectedCor=="Laranja"){
                                          temp="lib/imagens/gato_laranja.jpeg";
                                        }
                                        else if(selectedEspecie=="Gato"&&selectedTamanho=="Pequeno"&&selectedCor=="Cinza"){
                                          temp="lib/imagens/gato_pequeno_cinza.jpeg";
                                        }
                                        else if(selectedEspecie=="Gato"&&selectedTamanho=="Pequeno"&&selectedCor=="Branco"){
                                          temp="lib/imagens/gato_pequeno_branco_molhado_fodido_triste_gato.jpg";
                                        }
                                        else{
                                          temp="lib/imagens/cachorro.png";
                                        }

                                        Animal animal = Animal(
                                          id: const Uuid().v1(),
                                          sexo: selectedSexo!,
                                          especie: selectedEspecie!,
                                          tamanho: selectedTamanho!,
                                          cor: selectedCor!,
                                          local: localizacaoController.text,
                                          url: temp!,
                                          
                                          // Atualizado para File
                                        );


                                        // Adicionar animal ao Firestore
                                        firebase
                                            .collection("animal")
                                            .doc(animal.id)
                                            .set(animal.toMap());
                                        showSnackbar(
                                            context: context,
                                            texto:
                                                "Cadastro realizado com sucesso!");

                                                                                  // Limpar os controladores
                                                                                  
                                                    setState(() {
                                                      file = null;
                                                      selectedCor = null;
                                                      selectedSexo = null;
                                                      selectedEspecie = null;
                                                      selectedTamanho = null;
                                                    });
                                        
                                        corController.text = "";
                                        localizacaoController.text = "";
;
                                      },
                                      child: Text(
                                        'CONFIRMAR',
                                        style: TextStyle(
                                          color: verde_claro,
                                          fontWeight: FontWeight.w900,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Restante do código permanece o mesmo

  
  Future<XFile?> getImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    return image;
  }



  Future<void> uploadImage(String path, String nome) async {
    File file = File(path);
    try {
      String ref = 'animal/${nome}.jpg';

      final uploadTask = await storage.ref(ref).putFile(file);

      await uploadTask;

      final imageUrl = await storage.ref(ref).getDownloadURL();

      final userRef = FirebaseFirestore.instance.collection('Perfis');
      QuerySnapshot querySnapshot =
          await userRef.where('nome', isEqualTo: nome).get();

      if (querySnapshot.docs.isNotEmpty) {
        final userDoc = querySnapshot.docs.first;

        await userDoc.reference.update({'fotoURL': imageUrl});

        setState(() {
          foto = imageUrl;
        });
      } else {
        // O documento com o nome especificado não foi encontrado.
        // Você pode lidar com isso da maneira apropriada.

        print("Está vazio");
      }
    } catch (e) {
      print('Erro no upload: $e');
    }
  }



  Future<void> pickAndUploadImage(String nome) async {
    XFile? file = await getImageFromGallery();
    if (file != null) {
      await uploadImage(file.path, nome);
    }
    else{
      print("O arquivo é null");
    }
  }



}
