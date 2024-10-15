// child:ProductWidget(product:Product(productImge1:"https://img.freepik.com/free-photo/new-smartwatch-balancing-with-hand_23-2150296477.jpg?size=626&ext=jpg&ga=GA1.1.1056193589.1669837405&semt=ais",productImge2: "https://img.freepik.com/free-photo/pink-sweater-front_125540-746.jpg?size=626&ext=jpg&ga=GA1.1.1056193589.1669837405&semt=sph",productImge3:"https://img.freepik.com/free-photo/redhead-woman-looking-inside-shopping-bag_23-2148339162.jpg?size=626&ext=jpg&ga=GA1.1.1056193589.1669837405&semt=sph",productName:"Product Name",productPrice: 200.0,productOldPrice:300.0,productDescription: "ndkswodjo32jd3o2rh32irh8"),),

import 'package:amazon_stabrak/Models/Category.dart';
import 'package:amazon_stabrak/Screens/splash%20screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Blogic/Firebase/Auth.dart';
import 'Widget/categories.dart';
import '../Models/Product.dart';
import 'Cart view.dart';
import 'Category Screen.dart';
import 'Profile Screen.dart';
import 'Store Screen.dart';
import 'Themes/AppColors.dart';
import 'Widget/product.dart';

class HomeScreen2 extends StatefulWidget {
  HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {

  List<CategoryClass>list =[
    CategoryClass(name: "mobiles", image: "https://img.freepik.com/free-photo/tech-device-with-nature-background_23-2150470431.jpg?t=st=1708545839~exp=1708549439~hmac=288e7da9a0f32aa9ce4fd9c6a825985f42111004aadc5c7ff44b41380aee00ef&w=740"),
    CategoryClass(name: "laptop", image: "https://img.freepik.com/free-photo/laptop-balancing-with-purple-background_23-2150271750.jpg?t=st=1708545963~exp=1708549563~hmac=8606b3d0d8c4a05507c1682e41ec43d585013ff3ee01abf0c157d4275a5be8c3&w=740"),
    CategoryClass(name: "tablets", image: "https://img.freepik.com/free-photo/tablet-smartphone-smart-watch_23-2147791600.jpg?t=st=1708546071~exp=1708549671~hmac=3045739346424fb56528aac1380f90c80554bc1b067e135c11af96ea3c32aade&w=996"),
    CategoryClass(name: "HeadPhones", image: "https://img.freepik.com/free-photo/headphones-balancing-with-blue-background_23-2150271756.jpg?size=626&ext=jpg&ga=GA1.1.1056193589.1669837405&semt=ais"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.secondaryColor,
      ),
      appBar: AppBar(
        title: Text(
          "StabraK",
          style: TextStyle(
            color: AppColors.secondaryColor,
            fontSize: 20.sp,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        iconTheme: IconThemeData(color: AppColors.secondaryColor),
        actions: [

          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartView()));
            },
            icon: Icon(Icons.shopping_cart_rounded, color: AppColors.secondaryColor, size: 20.sp,),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: AppColors.secondaryColor, size: 20.sp,),
          ),
          IconButton(
            onPressed: () {
              Authentication.signOut();
             if(FirebaseAuth.instance.currentUser==null){
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SplashScreen()));
            }},
            icon: Icon(Icons.exit_to_app, color: AppColors.secondaryColor, size: 20.sp,),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200.h,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://img.freepik.com/free-photo/redhead-woman-looking-inside-shopping-bag_23-2148339162.jpg?size=626&ext=jpg&ga=GA1.1.1056193589.1669837405&semt=sph"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Welcome to Stabrak",
                      style: TextStyle(color: AppColors.primaryColor, fontSize: 20.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "All IN ONE",
                      style: TextStyle(color: AppColors.primaryColor, fontSize: 30.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 70.h,),
                  Container(
                    width: 180.w,
                    height: 40.h,
                    color: AppColors.primaryColor,
                    child: Row(
                      children: [
                        SizedBox(width: 10.w,),
                        Text(
                          "Shop Now",
                          style: TextStyle(color: AppColors.secondaryColor, fontSize: 15.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 47.w,),
                        IconButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => StoreScreen()));
                          },
                          icon: Icon(Icons.arrow_forward_ios_outlined, color: AppColors.secondaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 7.h,),
            Row(children: [
              SizedBox(width: 30.w,),
              Row(children: [
                Text("Categories",style: TextStyle(color: AppColors.secondaryColor,fontSize: 20.sp,fontWeight: FontWeight.bold),)
              ],)
            ],),

            Container(
              height: 200.h,
              child: GridView.builder(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    childAspectRatio: 1.5,
                  ),
                  itemCount: list.length,
                  itemBuilder: (context,index){
                    return  Padding(
                        padding:EdgeInsets.all(8.0),
                      child: CategoryWidget(category: list[index],),

                    );
                  }),
            ),

            Row(
              children: [
                SizedBox(width: 20.w,),
                Text(
                  "MOST ORDERED",
                  style: TextStyle(color: AppColors.secondaryColor, fontSize: 20.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 200.h,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("mostOrderd")
                      .snapshots(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ProductWidget(
                              product: Product(
                                productImge1: snapshot.data!.docs[index]["img1"],
                                productImge2: snapshot.data!.docs[index]["img2"],
                                productImge3: snapshot.data!.docs[index]["img3"],
                                productName: snapshot.data!.docs[index]["name"],
                                productPrice: snapshot.data!.docs[index]["price"],
                                productOldPrice: snapshot.data!.docs[index]
                                ["oldprice"],
                                productDescription: snapshot.data!.docs[index]
                                ["des"],
                                productColor1: Colors.black,
                                productColor2: Colors.blue,
                                productColor3: Colors.cyanAccent,
                              ),
                            ));
                      },
                    );
                  }),
                )// Adjust the height as needed
              ),
            Row(
              children: [
                SizedBox(width: 20.w,),
                Text("MOST POPULAR", style: TextStyle(color: AppColors.secondaryColor, fontSize: 20.sp, fontWeight: FontWeight.bold),),],),
            SizedBox(
              height: 200.h, // Adjust the height as needed
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("mostsale")
                      .snapshots(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ProductWidget(
                              product: Product(
                                productImge1: snapshot.data!.docs[index]["img1"],
                                productImge2: snapshot.data!.docs[index]["img2"],
                                productImge3: snapshot.data!.docs[index]["img3"],
                                productName: snapshot.data!.docs[index]["name"],
                                productPrice: snapshot.data!.docs[index]["price"],
                                productOldPrice: snapshot.data!.docs[index]
                                ["oldprice"],
                                productDescription: snapshot.data!.docs[index]
                                ["des"],
                                productColor1: Colors.black,
                                productColor2: Colors.blue,
                                productColor3: Colors.cyanAccent,
                              ),
                            ));
                      },
                    );
                  }),
                )
            ),
          ],
        ),
      ),
    );
  }
}