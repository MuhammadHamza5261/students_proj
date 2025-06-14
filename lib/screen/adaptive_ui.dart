import 'package:flutter/material.dart';


class AdaptiveUi extends StatefulWidget {
  const AdaptiveUi({super.key});

  @override
  State<AdaptiveUi> createState() => _AdaptiveUiState();
}

class _AdaptiveUiState extends State<AdaptiveUi> {
  @override
  Widget build(BuildContext context) {

   final screenWidth = MediaQuery.of(context).size.width;

   if(screenWidth < 600){

     return Scaffold(
       appBar: AppBar(
         title: const Text("Mobile Layout UI"),
       ),
       body: ListView.builder(
         itemCount: 20,
           itemBuilder: (context,index){
             return ListTile(
               leading: const Icon(Icons.monetization_on),
               title: Text("Item $index"),
             );
           }
       ),

     );

   }

   else{

     return Scaffold(
       appBar: AppBar(
         centerTitle: true,
         title: const Text("Grid View Builder"),
       ),
       body: GridView.builder(
           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 3,
             mainAxisSpacing: 10,
             crossAxisSpacing: 10
           ),
           itemBuilder: (context,index) => Container(
             alignment: Alignment.center,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               color: Colors.blueAccent,
             ),
             child: Text("Item $index"),
           )
       ),
     );

   }

  }
}
