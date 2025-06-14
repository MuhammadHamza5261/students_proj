import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quranic_app/bloc/ayat_bloc.dart';
import 'package:quranic_app/bloc/ayat_event.dart';
import 'package:quranic_app/bloc/ayat_state.dart';
import 'package:shape_maker/shape_maker.dart';
import 'package:shape_maker/shape_maker_painter.dart';
import 'package:shimmer/shimmer.dart';


class AyatScreen extends StatefulWidget {
  const AyatScreen({super.key});

  @override
  State<AyatScreen> createState() => _AyatScreenState();
}

class _AyatScreenState extends State<AyatScreen> {


  @override
  void initState() {
    super.initState();
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
                color: Colors.orangeAccent,
                size: 50,
              ),
            ):
                state is AyatLoadedState ? SingleChildScrollView(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                       itemCount: state.ayatModel.length,
                      itemBuilder: (context,index){
                        return  Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        const ShapeMaker(
                                          height: 35,
                                          width: 35,
                                          shapeType: ShapeType.hexagon,
                                          bgColor: Colors.deepOrange,
                                        ),
                                        Text(state.ayatModel[index].totalAyah.toString(),
                                          style: const TextStyle(
                                          color: Colors.white
                                        ),),

                                      ],
                                    ),
                                    Text(state.ayatModel[index].surahName.toString(),style: TextStyle(
                                      fontSize: 18
                                    ),),

                                    Shimmer.fromColors(
                                        baseColor: Colors.red,
                                        highlightColor: Colors.yellow,
                                        child: Text(state.ayatModel[index].surahNameArabicLong.toString(),style: TextStyle(
                                          fontSize: 18
                                        ),))


                                  ],

                                ),
                                Text(state.ayatModel[index].surahNameArabic.toString()),
                                Text(state.ayatModel[index].revelationPlace.toString()),
                                Text(state.ayatModel[index].surahNameTranslation.toString()),

                              ],

                            ),
                          ),

                        );
                      }
                  ),

                ): SizedBox();

          }
      ),
    );
  }
}
