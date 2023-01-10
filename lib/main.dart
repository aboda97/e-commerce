import 'package:e_commerce/layout/Home_cubit.dart';
import 'package:e_commerce/layout/app_cubit_theme/states.dart';
import 'package:e_commerce/layout/home_cubit/cubit.dart';
import 'package:e_commerce/modules/login_screen/login_screen.dart';
import 'package:e_commerce/modules/on_boarding_screen/on_boarding_screen.dart';
import 'package:e_commerce/shared/bloc_observer.dart';
import 'package:e_commerce/shared/constants.dart';
import 'package:e_commerce/shared/local/shared_preferences.dart';
import 'package:e_commerce/shared/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/app_cubit_theme/cubit.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  DioHelper.init();


  bool? isDark = CacheHelper.getData(key: 'isDark');
  Widget widget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  token = CacheHelper.getData(key: 'token');
  print('Your Token is $token');

  if(onBoarding != null)
  {
    if(token != null) widget = HomeScreen();
    else widget = LoginScreen();
  } else
  {
    widget = OnBoardingScreen();
  }

  runApp(MyApp(
    startWidget: widget,
   // onBoarding: onBoarding,
  ));
}

class MyApp extends StatelessWidget {
  bool? onBoarding;
  Widget? startWidget;

  MyApp({
    this.startWidget,
    this.onBoarding,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => ShopHomeCubit()..getHomeData()..getCategoryData()..getFavouriteData()..getUserData()),
        BlocProvider(
          create: (BuildContext context) => AppCubit(),
        )
      ],
      child:BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
      builder: (context, state){
      return MaterialApp(
            theme: ThemeData(
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarBrightness: Brightness.light,
                    statusBarIconBrightness: Brightness.dark,
                    statusBarColor: Colors.white
                ),
              ),
              scaffoldBackgroundColor: Colors.white,
            ),
            debugShowCheckedModeBanner: false,
            // routes: {
            //   HomeScreen.id : (context)=> HomeScreen(),
            //   OnBoardingScreen.id : (context)=> OnBoardingScreen(),
            //   LoginScreen.id : (context)=> LoginScreen(),
            //   RegisterScreen.id : (context)=> RegisterScreen(),
            // },
            // initialRoute: start,
            home: startWidget,
          );
        },
      ),
    );
  }
}


