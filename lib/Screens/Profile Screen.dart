import 'package:amazon_stabrak/Blogic/Firebase/Fire%20store.dart';
import 'package:amazon_stabrak/Models/User.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Edit Profile Screen.dart';
import 'Themes/AppColors.dart';

class  Profile extends StatefulWidget{
  const Profile({Key?Key}):super(key:Key);
  @override

  State<Profile> createState() =>_ProfileState();
}

class _ProfileState  extends State<Profile>{
  static final auth =FirebaseAuth.instance;
  String? name='';
  String? age='';
  String? phonenumber='';

Future<void> GetUserInfo() async{
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(auth.currentUser!.uid).get().then ((snapshot) {
      if(snapshot.exists){
          setState(() {
            name= snapshot.data()!['username'];
            age=snapshot.data()!['age'];
            phonenumber= snapshot.data()!['phonenumber'];
          });

      }else{
        print('No data');
       // return UserModel();

      }
    });
    //return UserModel();
  }

  UserModel?user;
  void getuser() async{
    user = await  FireStore.GetUserInfo() ; }
  @override
  void initState(){
    super.initState();
    GetUserInfo();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("Profile",style: TextStyle(color: AppColors.secondaryColor,fontSize: 20.sp,fontWeight: FontWeight.bold,),),leading: IconButton(icon: Icon(Icons.arrow_back,color: AppColors.secondaryColor,size: 25,), onPressed: () {
        Navigator.pop(context);
      },),backgroundColor:AppColors.primaryColor,
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileScreen()));
          }, icon: Icon(Icons.edit,color: AppColors.secondaryColor,size: 25.sp,))
        ],),
      body: Column(children: [
        SizedBox(height: 50.h,),
        Center(
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://img.freepik.com/free-photo/close-up-portrait-cheerful-glamour-girl-with-cute-make-up-smiling-white-teeth-looking-happy-camera-standing-blue-background_1258-70300.jpg?size=626&ext=jpg&ga=GA1.1.1056193589.1669837405&semt=ais"),
            radius:50.r,
          ),
        ),
        SizedBox(height: 20.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name!,style: TextStyle(color: AppColors.secondaryColor,fontSize: 20.sp,fontWeight: FontWeight.bold),),

          ],),
        SizedBox(height: 5.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(phonenumber!,style: TextStyle(color: AppColors.secondaryColor,fontSize: 15.sp),),

          ],),
        SizedBox(height: 50.h),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: AppColors.secondaryColor,
            width: MediaQuery.sizeOf(context).width,
            height: 150.h,
            child:Row(
              children: [
                SizedBox(width: 20.w,),
                Column(children: [
                  SizedBox(height: 40.h),
                  Text(
                    age!,style: TextStyle(color: AppColors.primaryColor,fontSize: 25.sp,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10.h),
                  Text("Age",style: TextStyle(color: AppColors.primaryColor,fontSize: 15.sp),),

                ],),
                SizedBox(width: 70.w,),
                Column(children: [
                  SizedBox(height: 40.h),
                  Text("10",style: TextStyle(color: AppColors.primaryColor,fontSize: 25.sp,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10.h),
                  Text("ORDERED",style: TextStyle(color: AppColors.primaryColor,fontSize: 15.sp),),

                ],),
                SizedBox(width: 70.w,),
                Column(children: [
                  SizedBox(height: 40.h),
                  Text("2500\$",style: TextStyle(color: AppColors.primaryColor,fontSize: 25.sp,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10.h),
                  Text("Total Price",style: TextStyle(color: AppColors.primaryColor,fontSize: 15.sp),),

                ],),
              ],
            ) ,
          ),
        )

      ],),
    );
  }

}