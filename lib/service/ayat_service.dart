import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quranic_app/model/ayat_model.dart';



class AyatService{

  Future<List<AyatModel>> ayatServiceMethod() async{
    
    final response = await http.get(Uri.parse("https://quranapi.pages.dev/api/surah.json"),

      headers: <String,String>{
        "Content-type": "Application/json",
        "Accept": "Application/josn",
      }
    );

    if(response.statusCode == 200){

      final List<dynamic> data = jsonDecode(response.body);
      List<AyatModel> ayatList = data.map((json)=> AyatModel.fromJson(json)).toList();
      return ayatList;

    }

    else{

      throw Exception("${response.reasonPhrase}: ${response.statusCode}");
    }
    
    
    

  }







}