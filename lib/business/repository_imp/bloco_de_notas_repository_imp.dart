import 'package:bloco_de_notas/business/model/bloco_de_notas.dart';
import 'package:bloco_de_notas/data/repository/bloco_de_notas_repository.dart';
import 'package:bloco_de_notas/data/utils/hash_generator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BlocoDeNotasRepositoryImp extends BlocoDeNotasRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> criarNovoBlocoDeNotas(BlocoDeNotas blocoDeNotas)async {
     firestore.collection('bloco_de_notas').doc(generateRandomCharacters()).set(blocoDeNotas.toMap());
  }

  @override
  Future<List<BlocoDeNotas>> listarBlocoDeNotas() async {
    List<BlocoDeNotas> blocos = [];

    try {
      QuerySnapshot querySnapshot =
          await firestore.collection('bloco_de_notas').get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        BlocoDeNotas bloco = BlocoDeNotas.fromMap(data);
        blocos.add(bloco);
      }
      return blocos;
    } catch (e) {
      print("Erro ao buscar os Blocos de Notas: $e");
      return [];
    }
  }
}
