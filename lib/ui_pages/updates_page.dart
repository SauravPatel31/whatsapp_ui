import 'package:flutter/material.dart';
import 'package:whatsapp_ui/utils/app_const_data.dart';
import 'package:whatsapp_ui/utils/ui_styling.dart';

class UpdatesPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return UpdatePageState();
  }
}

class UpdatePageState extends State<StatefulWidget>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: backGroundColor(),
     appBar: AppBar(
       backgroundColor: backGroundColor(),
         foregroundColor: Colors.white,
         title: Text("Updates",),
         actions: [
         IconButton(onPressed: (){}, icon: Icon(Icons.qr_code_scanner,color: whiteClr(),)),
         IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined,color: whiteClr(),)),
         IconButton(onPressed: (){}, icon: Icon(Icons.search,color: whiteClr(),)),
          PopupMenuButton(itemBuilder: (context) {
            return [
             PopupMenuItem(child: Text("Status privacy",style: TextStyle(color: whiteClr()))),
             PopupMenuItem(child: Text("Create channel",style: TextStyle(color: whiteClr()))),
             PopupMenuItem(child: Text("Setting",style: TextStyle(color: whiteClr()))),
            ];
          },
          color: Color(0xff121B22),
            position: PopupMenuPosition.under,
          )
         ]
     ),
     body: Padding(
       padding: const EdgeInsets.symmetric(horizontal: 10),
       child: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("Status",style: mytext17(),),
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/user.png"),
                ),
                title: Text("My status",style: mytext17(),),
                subtitle: Text("Tap to add status update",style: mytext13(),),
              ),
             Text("Recent updates",style: mytext13(),),
             SizedBox(
               height: 500,
               child: ListView.builder(itemBuilder: (context, index) {
                 return ListTile(
                   leading: CircleAvatar(backgroundImage: AssetImage(AppConstData.chatsdata[index]["profile_image"]),
                   child: Container(
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       border: Border.all(width: 2,color: mainColor())
                     ),
                   ),
                   ),
                   title: Text(AppConstData.chatsdata[index]["name"],style: mytext17(),),
                   subtitle: Text(AppConstData.chatsdata[index]["time"],style: mytext13(),),
                 );
               },
               itemCount: 8,
               ),
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Viewed updates",style: mytext13(),),
                 IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_down_outlined))
               ],
             )
           ],
         ),
       ),
     ),
     floatingActionButton: Column(
       mainAxisAlignment: MainAxisAlignment.end,
         children: [
           FloatingActionButton.small(
             backgroundColor: Color(0xff121B22),
             onPressed: (){},child: Icon(Icons.edit,color: whiteClr(),),),
           SizedBox(height: 10,),
           FloatingActionButton(
             backgroundColor: mainColor(),
             foregroundColor: Colors.black,
             onPressed: (){},
             child: Icon(Icons.camera_alt),
           )
         ],
     ),
   );
  }

}