// import 'package:flutter/material.dart';
//
// class DrawerScreen extends StatefulWidget {
//   const DrawerScreen({super.key});
//
//   @override
//   State<DrawerScreen> createState() => _DrawerScreenState();
// }
//
// class _DrawerScreenState extends State<DrawerScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.orangeAccent,
//       ),
//       drawer:  Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blueAccent
//               ),
//                 child: Text("Drawer Header")
//             ),
//             ListTile(
//               leading: Icon(Icons.mobile_friendly),
//               title: Text("First Text"),
//             ),
//             ListTile(
//               leading: Icon(Icons.mobile_friendly),
//               title: Text("First Text"),
//             ),
//           ],
//         ),
//
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:quranic_app/screen/ayat_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent
              ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.pink,
                    ),
                    Text("MuhammadHamza@truemedit.com",style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis

                    ),),

                  ],
                )
            ),
            const ListTile(
              leading: Icon(Icons.email,size: 40,),
              title: Text("Email",style: TextStyle(fontSize: 25),),
            ),
            const ListTile(
              leading: Icon(Icons.person,size: 40,),
              title: Text("Profile",style: TextStyle(fontSize: 25),),
            ),
            GestureDetector(
              onTap: (){
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Logout"),
                      content: const Text("Are you sure you want to Logout??"),
                      actions: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.black), // outline color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // roundness
                              ),

                            ),
                            onPressed: (){
                              Navigator.pop(context);
                            },

                            child: const Text("No")
                        ),
                       ElevatedButton(
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.pink,
                           shape: RoundedRectangleBorder(

                             borderRadius: BorderRadius.circular(10)
                           )
                         ),

                           onPressed: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context) => const DrawerScreen()));
                           },
                           child: const Text("Yes",style: TextStyle(
                             color: Colors.white
                           ),)
                       )
                      ],
                    );
                  },
                );
              },
              child: const ListTile(
                leading: Icon(Icons.login_outlined,size: 40,),
                title: Text("Logout",style: TextStyle(fontSize: 25),),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Drawer Screen",style: TextStyle(
          color: Colors.purple,
          fontSize: 40,
          fontWeight: FontWeight.w600
        ),),
        backgroundColor: Colors.orangeAccent,
      ),

    );
  }

  void _showPopupMenu() async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 100, 100, 100),
      items: [
        const PopupMenuItem<String>(
            child: Text('Doge'), value: 'Doge'),
        const PopupMenuItem<String>(
            child: Text('Lion'), value: 'Lion'),
      ],
      elevation: 8.0,
    );
  }
}
