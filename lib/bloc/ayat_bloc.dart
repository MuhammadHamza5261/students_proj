import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranic_app/bloc/ayat_event.dart';
import 'package:quranic_app/bloc/ayat_state.dart';
import 'package:quranic_app/model/ayat_model.dart';
import 'package:quranic_app/repository/ayat_repository.dart';



class AyatBloc extends Bloc<AyatEvent,GetAyatState>{

  List<AyatModel>? ayatModel;

  AyatRepository ayatRepository = AyatRepository();


  AyatBloc(): super(AyatInitialState()){

   on<AyatEvent>((event,emit) async {

     if(event is GetAyatEvent){

       emit(AyatProgressState());


       try{

         ayatModel = await ayatRepository.ayatRepositoryMethod();
         emit(AyatLoadedState(ayatModel: ayatModel!));

       }

           catch(e){

              emit (AyatErrorState(e.toString()));

           }
     }

   });




  }



}