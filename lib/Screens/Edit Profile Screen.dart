import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Themes/AppColors.dart';

class  EditProfileScreen extends StatefulWidget{
  const EditProfileScreen({Key?Key}):super(key:Key);
  @override

  State<EditProfileScreen> createState() =>_EditProfileScreenState();
}

class _EditProfileScreenState  extends State<EditProfileScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,title: Text("Editing Profile",style: TextStyle(color: AppColors.secondaryColor,fontSize: 20.sp,fontWeight: FontWeight.bold,),),leading: IconButton(icon: Icon(Icons.arrow_back,color: AppColors.secondaryColor,size: 25,), onPressed: () {
        Navigator.pop(context);
      },),backgroundColor:AppColors.primaryColor,actions: [
        IconButton(onPressed: (){
        }, icon:Icon(Icons.save,color: AppColors.secondaryColor,size: 25.sp,) )
      ],),

      body: Column(children: [
        SizedBox(height: 30.h,),
        Text(" Edit Your Information",style: GoogleFonts.anton(color: AppColors.secondaryColor,fontSize: 30.sp),),
        SizedBox(height: 20.h,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person,color: AppColors.secondaryColor,),

                label:Text("Full Name",style: TextStyle(color: AppColors.secondaryColor),),
                border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color:AppColors.secondaryColor)
                )

            ),

          ),
        ),
        SizedBox(height: 30.h,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone_iphone_outlined,color: AppColors.secondaryColor,),

                label:Text("Phone Number",style: TextStyle(color: AppColors.secondaryColor),),
                border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color:AppColors.secondaryColor)
                )

            ),

          ),
        ),
        SizedBox(height: 30.h,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.add,color: AppColors.secondaryColor,),

                label:Text(" Your Age",style: TextStyle(color: AppColors.secondaryColor),),
                border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color:AppColors.secondaryColor)
                )

            ),

          ),
        ),

      ],),

    );


  }
}