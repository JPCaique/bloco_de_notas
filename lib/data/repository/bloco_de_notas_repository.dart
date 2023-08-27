
import 'package:bloco_de_notas/business/model/bloco_de_notas.dart';

abstract class BlocoDeNotasRepository {
  Future<void> criarNovoBlocoDeNotas(BlocoDeNotas blocoDeNotas);
  Future<List<BlocoDeNotas>> listarBlocoDeNotas();
}

