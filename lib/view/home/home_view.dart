import 'package:bloco_de_notas/business/model/bloco_de_notas.dart';
import 'package:bloco_de_notas/view/home/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController tituloController = TextEditingController();
  TextEditingController textoController = TextEditingController();

  HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: FutureBuilder(
        future: homeController.listarBlocoDeNotas(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: ((context, index) {
                BlocoDeNotas blocoDeNotas = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 111, 209, 255),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text(blocoDeNotas.titulo ?? ''),
                      subtitle: Text(blocoDeNotas.texto ?? ''),
                    ),
                  ),
                );
              }),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              child: SizedBox(
                height: 500,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        controller: tituloController,
                        decoration: InputDecoration(
                          labelText: 'Titulo',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextField(
                        controller: textoController,
                        maxLength: 500,
                        maxLines: 8,
                        decoration: InputDecoration(
                          labelText: 'Texto',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async => homeController
                          .criarNovoBlocoDeNotas(
                        BlocoDeNotas(
                            titulo: tituloController.text,
                            texto: textoController.text),
                      )
                          .whenComplete(() {
                        Navigator.of(context).pop();
                        setState(() {
                          tituloController.text = '';
                          textoController.text = '';
                        });
                      }),
                      child: Text('Salvar'),
                    )
                  ],
                ),
              ),
            );
          },
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
