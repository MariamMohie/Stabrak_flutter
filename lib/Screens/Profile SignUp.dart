import 'package:amazon_stabrak/Blogic/Firebase/Fire%20store.dart';
import 'package:amazon_stabrak/Navigation%20bar/Navi.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Home screen.dart';
import 'Themes/AppColors.dart';

class  ProfileSignUp extends StatefulWidget{
  const ProfileSignUp({Key?Key}):super(key:Key);
  @override

  State<ProfileSignUp> createState() =>_ProfileSignUpState();
}

class _ProfileSignUpState  extends State<ProfileSignUp>{
  TextEditingController name =TextEditingController();
  TextEditingController age =TextEditingController();
  TextEditingController phone =TextEditingController();

  @override
  void dispose(){

    super.dispose();
    name.dispose();
    phone.dispose();
    age.dispose();


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(centerTitle: true,title: Text("Settings",style: TextStyle(color: AppColors.secondaryColor,fontSize: 20.sp,fontWeight: FontWeight.bold,),),leading: IconButton(icon: Icon(Icons.arrow_back,color: AppColors.secondaryColor,size: 25,), onPressed: () {
        Navigator.pop(context);
      },),backgroundColor:AppColors.primaryColor,),
      body: Column(children: [
        SizedBox(height: 30.h,),
        Text("Your Information",style: GoogleFonts.anton(color: AppColors.secondaryColor,fontSize: 30.sp),),
        SizedBox(height: 20.h,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: name,
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
            controller: phone,
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
            controller: age,
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
        SizedBox(height: 30.h,),
        ElevatedButton(onPressed: (){
          try{
            FireStore.AddUserInfo(name.text, age.text, phone.text);

            Navigator.push(context, MaterialPageRoute(builder: (context)=>Navi()));

          }catch(e){ print(e);}

        }, child: Text("Submit",style: TextStyle(fontSize: 12.sp,color: Colors.white),),style:ElevatedButton.styleFrom(backgroundColor: AppColors.secondaryColor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0.r,),),maximumSize: Size(100,40)),),

      ],),

    );
  }

}
