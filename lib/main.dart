import 'package:flutter/material.dart';
import 'package:whatsapp_ui/ui_pages/calls_page.dart';
import 'package:whatsapp_ui/ui_pages/communities_page.dart';
import 'package:whatsapp_ui/ui_pages/home.dart';
import 'package:whatsapp_ui/ui_pages/updates_page.dart';
import 'package:whatsapp_ui/utils/ui_styling.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:BottomNavBar() ,
    );
  }
}

class BottomNavBar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return BottomNavBarState();
  }

}

class BottomNavBarState extends State<StatefulWidget>{
  int selectedindex=0;
  List<Widget> navigatTo=[
    ChatsPage(),
    UpdatesPage(),
    CommunitiesPage(),
   CallsPage()
  ];
  @override
  Widget build(BuildContext context) {

   return Scaffold(
     body: navigatTo[selectedindex],
     bottomNavigationBar: NavigationBar(
       destinations: [
           NavigationDestination(icon: Icon(Icons.chat_outlined,color: Colors.white,), label: "Chats",selectedIcon: Icon(Icons.chat,color: Colors.white,),),
           NavigationDestination(icon: Icon(Icons.animation_rounded,color: Colors.white,), label: "Updates",selectedIcon: Icon(Icons.animation_rounded,color: Colors.white,)),
           NavigationDestination(icon: Icon(Icons.groups_outlined,color: Colors.white,), label: "Communitis",selectedIcon: Icon(Icons.groups,color: Colors.white,)),
           NavigationDestination(icon: Icon(Icons.call_outlined,color: Colors.white,), label: "Calls",selectedIcon: Icon(Icons.call,color: Colors.white,)),
         ],
       backgroundColor: backGroundColor(),
       selectedIndex: selectedindex,
       onDestinationSelected: (value){
           selectedindex=value;
           setState(() {
             
           });
       },
       indicatorColor: Color(0xff1FC162).withOpacity(0.3),


     ),
   );
  }

}

