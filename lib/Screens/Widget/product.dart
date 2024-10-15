import 'package:amazon_stabrak/Models/Product.dart';
import 'package:amazon_stabrak/Screens/Product%20Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Themes/AppColors.dart';

class ProductWidget extends StatefulWidget{
// instance from the class product We used
Product product;

ProductWidget({super.key, required this.product});
@override

State<ProductWidget> createState() =>_ProductWidgetState();
}

class _ProductWidgetState  extends State<ProductWidget>{
  @override
  Widget build(BuildContext context) {
   return GestureDetector(
     onTap: (){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductScreen(product: widget.product,)));
     },
     child: Container(
       decoration: BoxDecoration(color: AppColors.primaryColor,
         borderRadius: BorderRadius.circular(10.r),
         border: Border.all(width: 1.w,color: AppColors.secondaryColor),),
       width: 180.w,
       height: 170.h,
       child: Column(children: [
         Container(

           width: 180.w,
           height: 140.h,
           decoration:BoxDecoration(
             image: DecorationImage(image: NetworkImage(widget.product.productImge1!),fit: BoxFit.fill,),
             borderRadius: BorderRadius.circular(10.r),

           ),
         ),
         // SizedBox(height: 5.h,),
         Text(widget.product.productName!,style: TextStyle(overflow:TextOverflow.ellipsis,color: AppColors.secondaryColor,fontSize: 15.sp),),
         // SizedBox(height: 2.h,),
         Text(widget.product.productPrice!.toString()+" \$",style: TextStyle(color: AppColors.secondaryColor,fontSize: 18.sp),),
       ],),
     ),
   );
  }
}