import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_ui/ui/index_provider.dart';
import 'package:whatsapp_ui/ui/user_chats_page.dart';
import 'package:whatsapp_ui/utils/app_const_data.dart';
import 'package:whatsapp_ui/utils/ui_styling.dart';

class ChatsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return ChatesPageState();
  }

}

class ChatesPageState extends State<StatefulWidget>{
  MediaQueryData? mqData;
  @override
  Widget build(BuildContext context) {
    mqData=MediaQuery.of(context);
    return Scaffold(
      //backgroundColor: backGroundColor(),
      appBar: mqData!.orientation==Orientation.portrait?AppBar(
       // backgroundColor: backGroundColor(),
       // foregroundColor: Colors.white,
        title: Text("WhatsApp",),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.qr_code_scanner,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined,)),
          PopupMenuButton(
              //color: Color(0xff121B22),
              position: PopupMenuPosition.under,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              itemBuilder: (_){
                return [
                  PopupMenuItem(
                      child: Text("New group",)),
                  PopupMenuItem(
                      child: Text("New broadcast",)),
                  PopupMenuItem(
                      child: Text("Linked devices",)),
                  PopupMenuItem(
                      child: Text("Starred messages",)),
                  PopupMenuItem(
                      child: Text("Payments",)),
                  PopupMenuItem(
                      child: Text("Settings",)),

                ];
              })
        ],

      ):null,
      body: mqData!.orientation==Orientation.portrait?SingleChildScrollView(
        child: Column(
          children: [
            ///searchBar..
            Container(
              width: mqData!.size.width,
              height: 50,
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xff222A2F),
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  hintText: "Ask Meta AI or Search",
                  prefixIcon: Lottie.asset("assets/lottie/meta.json",width: 17,height: 17),
                  suffixIcon: Icon(Icons.search),
                    
                ),
              ),
            ),
            ///Chats List..
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UserChatsPage(sindex: index)));
                  },
                  child: ListTile(
                    minVerticalPadding: 8,
                    leading: CircleAvatar(
                      maxRadius: 26,
                      backgroundImage: AssetImage(AppConstData.chatsdata[index]["profile_image"]),
                    ),
                    title: Text(AppConstData.chatsdata[index]["name"],style: mytext17(),),
                    subtitle: Text(AppConstData.chatsdata[index]["subtext"],style: mytext13(),),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(AppConstData.chatsdata[index]["time"],style: mytext11(mycolr: Colors.green),),
                        CircleAvatar(
                            maxRadius:10,
                            backgroundColor: Color(0xff25D165),
                            child: Center(child: Text(AppConstData.chatsdata[index]["unread"],style: mytext11(mycolr: Colors.black),)))
                      ],
                    ),
                  ),
                );
              },
              itemCount: AppConstData.chatsdata.length,
            ),
          ],
        ),
      ):Row(
          children: [
            ///Chats List..
            Expanded(
              flex: 2,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      ///Chats and Icons..
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Chats",style: mytext17(),),
                          Row(
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.note_alt_outlined)),
                              IconButton(onPressed: (){}, icon: Icon(Icons.filter_list_rounded)),
                            ],
                          )
                        ],
                      ),
                      ///SearchBar..
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xff222A2F),
                          border: InputBorder.none,
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30)
                          ),
                          hintText: "Ask Meta AI or Search",
                          prefixIcon: Lottie.asset("assets/lottie/meta.json",width: 17,height: 17),
                          suffixIcon: Icon(Icons.search),

                        ),
                      ),
                      ///Chats List..
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                          return ListTile(
                            onTap: (){
                              if(mqData!.orientation==Orientation.portrait){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>UserChatsPage(sindex: index)));
                              }else{
                               context.read<IndexProvider>().updateIndex(index);
                              }
                            },
                            minVerticalPadding: 8,
                            leading: CircleAvatar(
                              maxRadius: 26,
                              backgroundImage: AssetImage(AppConstData.chatsdata[index]["profile_image"]),
                            ),
                            title: Text(AppConstData.chatsdata[index]["name"],style: mytext17(),),
                            subtitle: Text(AppConstData.chatsdata[index]["subtext"],style: mytext13(),),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(AppConstData.chatsdata[index]["time"],style: mytext11(mycolr: Colors.green),),
                                CircleAvatar(
                                    maxRadius:10,
                                    backgroundColor: Color(0xff25D165),
                                    child: Center(child: Text(AppConstData.chatsdata[index]["unread"],style: mytext11(mycolr: Colors.black),)))
                              ],
                            ),
                          );
                        },
                        itemCount: AppConstData.chatsdata.length,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ///Cheating Page..
            Expanded(
              flex: 3,
              child: Consumer<IndexProvider>(
                  builder: (_,provider,__){
                    return UserChatsPage(sindex: provider.getIndex());
                  },
              ),
            )
            //

          ],
      ),
      floatingActionButton: mqData!.orientation==Orientation.portrait?FloatingActionButton(
        backgroundColor:  Color(0xff25D165),
        foregroundColor: Colors.black,
        onPressed: (){},
        child: Icon(Icons.message),
      ):null,

    );
  }

}