import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_task/screen/auth/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  var auth=FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: SafeArea(
        child: SingleChildScrollView(
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15,),
          StreamBuilder<QuerySnapshot>(
          stream:FirebaseFirestore.instance.collection("user").snapshots() ,
          builder:(context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else{
              return  ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    QueryDocumentSnapshot document=snapshot.data!.docs[index];
                    return  auth.currentUser!.uid==document["uid"]?
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Container(
                        height:size.height*0.15,
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white.withOpacity(0.2)
                        ),
                        child: Center(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage: NetworkImage("${document["photo"]}"),
                            ),
                            title: Text("${document["name"]}",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(color:Color(0xff1F2937), fontSize: 16,fontWeight: FontWeight.bold),
                              ),),
                            subtitle: Text("${document["email"]}",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(color:Color(0xff1F2937), fontSize: 12,fontWeight: FontWeight.bold),
                              ),),
                            trailing: Icon(Icons.notification_important,size: 32,),

                          ),
                        ),
                      ),
                    ):Container();
                  });
            }

          },
    ),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height:size.height*0.15,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white.withOpacity(0.2)
                  ),
                  child: Center(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 15,
                        backgroundImage:AssetImage("assets/Frame (3).png",),
                        backgroundColor: Colors.white,
                      ),
                      title: Text("Account setting",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(color:Color(0xff1F2937), fontSize: 16,fontWeight: FontWeight.bold),
                        ),),

                      trailing:Image(image: AssetImage("assets/Frame (4).png"),)

                    ),
                  ),
                ),
              ),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height:size.height*0.4,
                  width: size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white.withOpacity(0.2)
                  ),
                  child: Column(
                    children: [
                      ListTile(
                          leading: Image(image: AssetImage("assets/Frame 12.png"),height: 25,width: 25,),
                          title: Text("Language",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(color:Color(0xff1F2937), fontSize: 16,fontWeight: FontWeight.bold),
                            ),),

                          trailing:Icon(Icons.arrow_forward_ios,size: 25,)

                      ),
                      ListTile(
                          leading: Image(image: AssetImage("assets/Frame (5).png"),height: 25,width: 25,),
                          title: Text("Feedback",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(color:Color(0xff1F2937), fontSize: 16,fontWeight: FontWeight.bold),
                            ),),

                          trailing:Icon(Icons.arrow_forward_ios,size: 25,)

                      ),
                      ListTile(
                          leading: Image(image: AssetImage("assets/Frame 11.png"),height: 25,width: 25,),
                          title: Text("Rate us",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(color:Color(0xff1F2937), fontSize: 16,fontWeight: FontWeight.bold),
                            ),),

                          trailing:Icon(Icons.arrow_forward_ios,size: 25,)

                      ),
                      ListTile(
                          leading: Image(image: AssetImage("assets/Frame (6).png"),height: 25,width: 25,),
                          title: Text("New Version",
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(color:Color(0xff1F2937), fontSize: 16,fontWeight: FontWeight.bold),
                            ),),

                          trailing:Icon(Icons.arrow_forward_ios,size: 25,)

                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25,),
              InkWell(
                onTap: (){
                  auth.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
                },
                child: Container(
                  height: 38,
                  width: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.redAccent
                  ),
                  child: Center(
                    child:Text("logOut",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(color:Color(0xffffffff), fontSize: 15,fontWeight: FontWeight.bold),
                      ),) ,
                  ),
                ),
              )



            ],
          ),
        ),
      ),
    );
  }
}
