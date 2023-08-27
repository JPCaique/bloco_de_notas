
import 'package:bloco_de_notas/business/model/bloco_de_notas.dart';
import 'package:bloco_de_notas/business/repository_imp/bloco_de_notas_repository_imp.dart';

class BlocoDeNotasUsecase {
  BlocoDeNotasRepositoryImp blocoDeNotasRepositoryImp = BlocoDeNotasRepositoryImp();

   Future<void> criarNovoBlocoDeNotas(BlocoDeNotas blocoDeNotas) async{
    await blocoDeNotasRepositoryImp.criarNovoBlocoDeNotas(blocoDeNotas);
   }

  Future<List<BlocoDeNotas>> listarBlocoDeNotas() async {
    return await blocoDeNotasRepositoryImp.listarBlocoDeNotas();
  }


}