
import 'package:amazon_stabrak/Screens/splash%20screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../firebase_options.dart';
import 'SignIn screen.dart';
import 'SignUp screen.dart';
import 'Themes/AppColors.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),

    );

  }

}
class HomeScreen extends StatefulWidget{
  const HomeScreen ({Key?Key}):super(key:Key);

  @override
  State<HomeScreen> createState()=>_HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 35.h,
          ),
          Center(child: Image(image: NetworkImage("https://i.imgur.com/zZR7pS9.png"),),),
          SizedBox(
            height: 60.h,
          ),
          Row(children: [
            SizedBox(width: 35.h,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder:(context)=>SignUp()));
              },
              child: Container( width: 120.h,height: 60.h,child: Center(child: Text("SignUp",style:TextStyle(color: Colors.white,fontSize: 25.sp,),)),
                decoration: BoxDecoration(color:AppColors.secondaryColor,borderRadius: BorderRadius.circular(10.r),border: Border.all(width: 3.h,color:AppColors.secondaryColor)),),
            ).animate().fade(duration: 2.seconds),
            SizedBox(width: 20.h,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
              },
              child: Container( width: 120.h,height: 60.h,child: Center(child: Text("SignIn",style:TextStyle(color: AppColors.secondaryColor,fontSize: 25.sp,),)),
                decoration: BoxDecoration(color:AppColors.primaryColor,borderRadius: BorderRadius.circular(10.r),border: Border.all(width: 3.h,color:AppColors.secondaryColor)),),
            ).animate().fade(duration: 2.seconds),
          ],)
        ],
      ),

    );

  }
}

