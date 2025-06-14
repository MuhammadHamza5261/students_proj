import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quranic_app/bloc/ayat_bloc.dart';
import 'package:quranic_app/screen/bottom_nav_bar.dart';
import 'package:quranic_app/screen/drawer_screen.dart';


void main() {
  runApp(
    MultiBlocProvider(
        providers: [

          BlocProvider<AyatBloc>(create: (context)=> AyatBloc())

        ],
        child: const MyApp(),
    ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DrawerScreen(),
    );
  }
}


