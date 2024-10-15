
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Category Screen.dart';
import 'Themes/AppColors.dart';

class  StoreScreen extends StatefulWidget{
  const  StoreScreen({Key?Key}):super(key:Key);
  @override

  State<StoreScreen> createState() =>_StoreScreenState();
}

class _StoreScreenState extends  State<StoreScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar

        (backgroundColor: AppColors.primaryColor,
        leading: IconButton(onPressed: () {
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back,color: AppColors.secondaryColor,),),
        title: Text("Store", style: GoogleFonts.anton(color: AppColors.secondaryColor,fontSize: 25.sp,),),centerTitle: true,),
      body: SingleChildScrollView(child: Column(children: [
        SizedBox(height: 10.h,),
        Row(
          children: [
            SizedBox(width: 10.w,),
            Text("Clothes",style: GoogleFonts.abyssinicaSil(color: AppColors.secondaryColor,fontWeight: FontWeight.bold,fontSize: 20.sp),),
          ],
        ),
        Container(
          height: 180.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder:(context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen(product: )));
                    },
                    child: Container(
                      decoration: BoxDecoration(color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(width: 1.w,color: AppColors.secondaryColor),),
                      width: 155.w,
                      height: 140.h,
                      child: Column(children: [
                        Container(
                          width: 155.w,
                          height: 100.h,
                          decoration:BoxDecoration(
                            image: DecorationImage(image: NetworkImage("https://img.freepik.com/free-photo/black-shirt-with-word-ultra-it_1340-37775.jpg?size=626&ext=jpg&ga=GA1.1.1056193589.1669837405&semt=sph"),fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Text("Product Name",style: TextStyle(color: AppColors.secondaryColor,fontSize: 15.sp),),
                        SizedBox(height: 10.h,),
                        Text("200\$ ",style: TextStyle(color: AppColors.secondaryColor,fontSize: 18.sp,fontWeight: FontWeight.bold),),
                      ],),
                    ),
                  ),
                );
              }),
        ),
        Row(
          children: [
            SizedBox(width: 10.w,),
            Text("Electronics",style: GoogleFonts.abyssinicaSil(color: AppColors.secondaryColor,fontWeight: FontWeight.bold,fontSize: 20.sp),),
          ],
        ),

        Container(
          height: 100.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context,index){
                return CircleAvatar(
                  radius: 70.r,
                  backgroundImage: NetworkImage("https://img.freepik.com/free-photo/headphones-balancing-with-blue-background_23-2150271756.jpg?size=626&ext=jpg&ga=GA1.1.1056193589.1669837405&semt=ais",),

                );
              }),
        ),
        Row(
          children: [
            SizedBox(width: 10.w,),
            Text("Furneture",style: GoogleFonts.abyssinicaSil(color: AppColors.secondaryColor,fontWeight: FontWeight.bold,fontSize: 20.sp),),
          ],
        ),

        Container(
          height: 180.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder:(context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoriesScreen(name: "Mariam")));
                    },
                    child: Container(
                      decoration: BoxDecoration(color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(width: 1.w,color: AppColors.secondaryColor),),
                      width: 155.w,
                      height: 100.h,
                      child: Column(children: [
                        Container(
                          width: 155.w,
                          height: 100.h,
                          decoration:BoxDecoration(
                            image: DecorationImage(image: NetworkImage("https://img.freepik.com/free-photo/picture-frame-with-abstract-art-by-pink-velvet-armchair_53876-128125.jpg?size=626&ext=jpg&ga=GA1.1.1056193589.1669837405&semt=sph"),fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Text("Product Name",style: TextStyle(color: AppColors.secondaryColor,fontSize: 15.sp),),
                        SizedBox(height: 10.h,),
                        Text("200\$ ",style: TextStyle(color: AppColors.secondaryColor,fontSize: 18.sp,fontWeight: FontWeight.bold),),
                      ],),
                    ),
                  ),
                );
              }),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context,index){
                return ListTile(
                  leading: Image(image: NetworkImage("https://img.freepik.com/free-photo/discount-headphones-podium_23-2150165451.jpg?size=626&ext=jpg&ga=GA1.1.1056193589.1669837405&semt=ais"),),
                  title: Text('Item Name $index'),
                  subtitle: Text('Subtiltle $index'),
                  trailing: IconButton(onPressed: () {  }, icon: Icon(Icons.clear),),
                );
              }),
        )
      ],),),
    );
  }
}