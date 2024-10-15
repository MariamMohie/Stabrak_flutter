import 'package:amazon_stabrak/Models/Product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Blogic/Firebase/Fire store.dart';
import '../Models/cartitem.dart';
import 'Themes/AppColors.dart';

class ProductScreen extends StatefulWidget{
   ProductScreen({super.key,required this.product});
Product product;
  @override

  State<ProductScreen> createState() =>_ProductScreenState();
}

class _ProductScreenState  extends  State<ProductScreen>{
  int indexcolor=0;
  int index=0;
  int counter=0;
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        height: 80.h,

        child: Row(children: [
          SizedBox(width: 20.w,),
          Container(
            width: 150.w,
            height: 40.h,
            decoration: BoxDecoration(color: AppColors.tertiaryColor,borderRadius: BorderRadius.circular(5.r)),
            child: Row(children: [
              SizedBox(width: 20.w,),
              GestureDetector(
                onTap: (){

                },
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      counter--;
                    });
                  },
                  child: Container(
                    width:30,
                    height: 30,
                    decoration: BoxDecoration(color: AppColors.secondaryColor,borderRadius: BorderRadius.circular(5.r)),
                    child: Center(child: Text("-",style: TextStyle(color: AppColors.primaryColor,fontSize: 25.sp),)),
                  ),
                ),
              ),
              SizedBox(width: 20.w,),
              Container(
                width: 30.w,
                  height: 30.w,


                  child: Text(counter.toString(),style: TextStyle(color: AppColors.secondaryColor,fontSize: 17.sp,),))
              ,
              SizedBox(width: 10.w,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    counter++;
                  });
                },
                child: Container(
                  width:30,
                  height: 30,
                  decoration: BoxDecoration(color: AppColors.secondaryColor,borderRadius: BorderRadius.circular(5.r)),
                  child: Center(child: Text("+",style: TextStyle(color: AppColors.primaryColor,fontSize: 23.sp),)),
                ),
              ),

            ],),),
          SizedBox(width: 50.w,),
          GestureDetector(
            onTap: (){
               if (counter > 0) {
                cartitems.add(CartItem(
                  name:widget.product.productName,
                  image:widget.product.productImge1 ,
                  count: counter,
                  singleprice:widget.product.productPrice,
                  totalprice: widget.product.productPrice! * counter,
                ));

                print(cartitems.length);
              }
              else{
                SnackBar(content: Text("Please Add Quantity"));
              }
            },
            child: Container(
                width: 130.w,
                height: 40.h,
                decoration: BoxDecoration(color: AppColors.tertiaryColor,borderRadius: BorderRadius.circular(5.r)),
                child: Row(children: [
                  SizedBox(width: 10.w,),
                  Icon(Icons.shopping_cart,color: AppColors.secondaryColor,size: 20,),
                  SizedBox(width: 10.w,),
                  Text(("Add To Cart"),style: TextStyle(color: AppColors.secondaryColor,fontWeight:FontWeight.bold,fontSize: 15.sp),)
                ],)
            ),
          )
        ],),
      ),
      body: SingleChildScrollView(
        child: Column(children: [

          SizedBox(height: 20.h,),
          if(index==0)...{
          Padding(
            padding: const EdgeInsets.all(2.0),

            child: Container(

              width: MediaQuery.of(context).size.width,
              height: 250.h,
              child: Row(children: [
                SizedBox(width: 5.h,),
                CircleAvatar(radius: 20.r,backgroundColor:AppColors.tertiaryColor,child: IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new,color: AppColors.secondaryColor,size: 25,))),
                SizedBox(width: 270.w,),
                CircleAvatar(radius: 20.r,backgroundColor:AppColors.tertiaryColor,
                    child: IconButton(onPressed: (){
                      FireStore.AddToWishList(
                        widget.product.productName!,
                        widget.product.productDescription!,
                        widget.product.productPrice! ,
                        widget.product.productOldPrice!,
                        widget.product.productImge1!,
                        widget.product.productImge2!,
                        widget.product.productImge3!,
                      );
                      print("okey");
                    }, icon: Icon(Icons.favorite,color: Colors.red,size: 25,))),
              ],),
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(widget.product.productImge1!),fit: BoxFit.cover),

              ),
            ),
          ),},
          if(index==1)...{
            Padding(
              padding: const EdgeInsets.all(2.0),

              child: Container(

                width: MediaQuery.of(context).size.width,
                height: 250.h,
                child: Row(children: [
                  SizedBox(width: 5.h,),
                  CircleAvatar(radius: 20.r,backgroundColor:AppColors.tertiaryColor,child: IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new,color: AppColors.secondaryColor,size: 25,))),
                  SizedBox(width: 270.w,),
                  CircleAvatar(radius: 20.r,backgroundColor:AppColors.tertiaryColor,
                      child: IconButton(onPressed: (){
                        FireStore.AddToWishList(
                          widget.product.productName!,
                          widget.product.productDescription!,
                          widget.product.productPrice! ,
                          widget.product.productOldPrice!,
                          widget.product.productImge1!,
                          widget.product.productImge2!,
                          widget.product.productImge3!,
                        );
                      }, icon: Icon(Icons.favorite,color: Colors.red,size: 25,))),
                ],),
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(widget.product.productImge2!),fit: BoxFit.cover),

                ),
              ),
            ),},
          if(index==2)...{
            Padding(
              padding: const EdgeInsets.all(2.0),

              child: Container(

                width: MediaQuery.of(context).size.width,
                height: 250.h,
                child: Row(children: [
                  SizedBox(width: 5.h,),
                  CircleAvatar(radius: 20.r,backgroundColor:AppColors.tertiaryColor,child: IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new,color: AppColors.secondaryColor,size: 25,))),
                  SizedBox(width: 270.w,),
                  CircleAvatar(radius: 20.r,backgroundColor:AppColors.tertiaryColor,child: IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.red,size: 25,))),
                ],),
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(widget.product.productImge3!),fit: BoxFit.cover),

                ),
              ),
            ),},



          Row(children: [
            SizedBox(width: 10.w,),
            GestureDetector(
              onTap: (){
               setState(() {
                   index=0;
               });
              },
              child: Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    //"https://img.freepik.com/free-photo/pink-sweater-front_125540-746.jpg?size=626&ext=jpg&ga=GA1.1.1056193589.1669837405&semt=sph"
                    border: Border.all(color: AppColors.secondaryColor,width: 1.w),
                    image: DecorationImage(image: NetworkImage(widget.product.productImge1!,),fit: BoxFit.cover),
                  )
              ),
            ),
            SizedBox(width: 10.w,),
            GestureDetector(
              onTap: (){
                setState(() {
                   index=1;
                });
              },
              child: Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: AppColors.secondaryColor,width: 1.w),
                    image: DecorationImage(image: NetworkImage(widget.product.productImge2!,),fit: BoxFit.cover),
                  )
              ),
            ),
            SizedBox(width: 10.w,),
            GestureDetector(
              onTap: (){
               setState(() {
               index=2;
               });
              },
              child: Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    border: Border.all(color: AppColors.secondaryColor,width: 1.w,),
                    image: DecorationImage(image: NetworkImage(widget.product.productImge3!,),fit: BoxFit.cover),
                  )
              ),
            ),

          ]
          ),
          SizedBox(height: 20.h,),
          Row(children: [
            SizedBox(width: 20.w,),
            Container(width: 300.w,child: Text(widget.product.productName!,style: TextStyle(color: AppColors.secondaryColor,fontSize: 17.sp,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,)),

          ],),
          SizedBox(height: 15.h,),
          Row(children: [
            SizedBox(width: 20.w,),
            Text(widget.product.productPrice!.toString()+"\$",style: TextStyle(color: AppColors.secondaryColor,fontSize: 20.sp,fontWeight: FontWeight.bold),),
            SizedBox(width: 10.w,),
            Text(widget.product.productOldPrice!.toString()+"\$",style: TextStyle(color: Colors.black38,fontSize: 16.sp,fontWeight: FontWeight.bold),),

          ],),
          SizedBox(height: 20.h,),
          Row(
            children: [
             SizedBox(width: 15.w,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    indexcolor=0;
                  });
                },
                child: Container(
                  height: 40.h,
                  width: 50.w,
                    decoration: BoxDecoration( color: widget.product.productColor1,
                        borderRadius: BorderRadius.circular(10.r))
                ),
              ),
              SizedBox(width: 15.w,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    indexcolor=1;
                  });
                },
                child: Container(
                  height: 40.h,
                  width: 50.w,
                    decoration: BoxDecoration( color: widget.product.productColor2,
                        borderRadius: BorderRadius.circular(10.r))
                ),
              ),
              SizedBox(width: 15.w,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    indexcolor=2;
                  });
                },
                child: Container(
                  height: 40.h,
                  width: 50.w,
                  decoration: BoxDecoration( color: widget.product.productColor3,
                  borderRadius: BorderRadius.circular(10.r)),

                ),
              ),


            ],

          ),
          SizedBox(height: 10.h,),
          Row(children: [
            SizedBox(width: 10.w,),
            Container(
              width: 300.w,
                child: Text(widget.product.productDescription!,style: TextStyle(color: AppColors.secondaryColor,fontSize: 15.sp,fontWeight: FontWeight.bold),maxLines: 3,overflow: TextOverflow.ellipsis,)),

          ],),

        ],),
      ),
    );
  }
}