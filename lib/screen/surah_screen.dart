import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shape_maker/shape_maker.dart';
import 'package:shape_maker/shape_maker_painter.dart';
import 'package:shimmer/shimmer.dart';
import '../bloc/ayat_bloc.dart';
import '../bloc/ayat_event.dart';
import '../bloc/ayat_state.dart';


class SurahScreen extends StatefulWidget {
  const SurahScreen({super.key});

  @override
  State<SurahScreen> createState() => _SurahScreenState();

}

class _SurahScreenState extends State<SurahScreen> {

  @override
  void initState() {

    super.initState();
    // BlocProvider.of<SurahBloc>(context).add(GetSurahEvent());

     BlocProvider.of<AyatBloc>(context).add(GetAyatEvent());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<AyatBloc,GetAyatState>(
        builder: (context,state){
          return state is AyatProgressState ?  const Center(
            child: SpinKitFadingCircle(
              color: Colors.deepOrange,
              size: 50,
            ),
          ):
              state is AyatLoadedState ?
             SingleChildScrollView(
               child: ListView.builder(
                 shrinkWrap: true,
                 physics: const NeverScrollableScrollPhysics(),
                 itemCount: state.ayatModel.length,
                   itemBuilder: (context,index){
                   // return ListTile(
                   //   leading: Text(state.surahModel[index].totalAyah.toString()),
                   //   title: Text(state.surahModel[index].surahName!),
                   //   subtitle: Text(state.surahModel[index].surahNameArabic!),
                   //   trailing: Text(state.surahModel[index].revelationPlace!),
                   //
                   // );
                     return  Card(
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(20)
                       ),
                       elevation: 50,
                       child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                         child: Column(
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Stack(
                                   alignment: Alignment.center,
                                   children: [
                                     ShapeMaker(
                                       width: 40,
                                       height: 40,
                                       shapeType: ShapeType.hexagon,
                                       bgColor: Colors.deepOrange,
                                     ),
                                     Text(state.ayatModel[index].totalAyah.toString(),style: const TextStyle(
                                         fontSize: 16,
                                       color: Colors.white
                                     ),),
                                   ],

                                 ),
                                 Text(state.ayatModel[index].surahName!,style: const TextStyle(
                                     fontSize: 20
                                 ),),
                                 Shimmer.fromColors(
                                   baseColor: Colors.red,
                                   highlightColor: Colors.yellow,
                                   child: Text(state.ayatModel[index].surahNameArabicLong!,style: const TextStyle(
                                       fontSize: 20
                                   ),),
                                 ),

                               ],
                             ),







                             Text(state.ayatModel[index].surahNameArabic!,style: const TextStyle(
                               fontSize: 20
                             ),),
                             Text(state.ayatModel[index].revelationPlace!,style: const TextStyle(
                                 fontSize: 18
                             ),),
                             Text(state.ayatModel[index].surahNameTranslation!,style: const TextStyle(
                                 fontSize: 18
                             ),),



                           ],
                         ),
                       ),
                     );

                   }
               ),

             ): const SizedBox();

        }
      )
    );
  }
}
