import 'package:quranic_app/model/ayat_model.dart';

abstract class GetAyatState{}

class AyatInitialState extends GetAyatState{}

class AyatProgressState extends GetAyatState{}

class AyatLoadedState extends GetAyatState{

 final List<AyatModel> ayatModel;
 AyatLoadedState({required this.ayatModel});

}

class AyatErrorState extends GetAyatState{

  final String errorMessage;
  AyatErrorState(this.errorMessage);


}


