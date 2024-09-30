import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/ui/calls_page.dart';
import 'package:whatsapp_ui/ui/communities_page.dart';
import 'package:whatsapp_ui/ui/home.dart';
import 'package:whatsapp_ui/ui/index_provider.dart';
import 'package:whatsapp_ui/ui/updates_page.dart';
import 'package:whatsapp_ui/utils/ui_styling.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context)=>IndexProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xff091319),

      ),
      themeMode: ThemeMode.dark,
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
           NavigationDestination(icon: Icon(Icons.chat_outlined,), label: "Chats",selectedIcon: Icon(Icons.chat),),
           NavigationDestination(icon: Icon(Icons.animation_rounded), label: "Updates",selectedIcon: Icon(Icons.animation_rounded)),
           NavigationDestination(icon: Icon(Icons.groups_outlined), label: "Communitis",selectedIcon: Icon(Icons.groups)),
           NavigationDestination(icon: Icon(Icons.call_outlined), label: "Calls",selectedIcon: Icon(Icons.call)),
         ],
      // backgroundColor: backGroundColor(),
       selectedIndex: selectedindex,
       onDestinationSelected: (value){
           selectedindex=value;
           setState(() {});
       },
       indicatorColor: Color(0xff1FC162).withOpacity(0.3),


     ),
   );
  }

}

