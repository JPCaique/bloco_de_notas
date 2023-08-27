import 'package:bloco_de_notas/business/model/bloco_de_notas.dart';
import 'package:bloco_de_notas/business/usecase/bloco_de_notas_usecase.dart';

class HomeController {
  BlocoDeNotasUsecase blocoDeNotasUsecase = BlocoDeNotasUsecase();

  Future<void> criarNovoBlocoDeNotas(BlocoDeNotas blocoDeNotas) async {
    return blocoDeNotasUsecase.criarNovoBlocoDeNotas(blocoDeNotas);
  }

  Future<List<BlocoDeNotas>> listarBlocoDeNotas() async {
    return blocoDeNotasUsecase.listarBlocoDeNotas();
  }
}
