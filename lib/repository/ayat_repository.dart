
import 'package:quranic_app/model/ayat_model.dart';
import 'package:quranic_app/service/ayat_service.dart';

class AyatRepository{


List<AyatModel>? ayatModel;

AyatService ayatService = AyatService();


  Future<List<AyatModel>> ayatRepositoryMethod() async{

    ayatModel = await ayatService.ayatServiceMethod();
    return ayatModel!;

  }


}