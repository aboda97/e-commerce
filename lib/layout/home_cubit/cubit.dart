import 'package:e_commerce/layout/home_cubit/states.dart';
import 'package:e_commerce/models/category_model.dart';
import 'package:e_commerce/models/favourite_model.dart';
import 'package:e_commerce/models/get_favourites.dart';
import 'package:e_commerce/models/home_model.dart';
import 'package:e_commerce/models/login_model.dart';
import 'package:e_commerce/modules/categories_screen/category_screen.dart';
import 'package:e_commerce/modules/favourites_screen/favourite_screen.dart';
import 'package:e_commerce/modules/products_screen/product_screen.dart';
import 'package:e_commerce/modules/settings_screen/setting_screen.dart';
import 'package:e_commerce/shared/constants.dart';
import 'package:e_commerce/shared/end_points.dart';
import 'package:e_commerce/shared/remote/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ShopHomeCubit extends Cubit<ShopHomeStates> {
  ShopHomeCubit() : super(ShopHomeInitialState());

  //make object of AppCubit
  static ShopHomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomNavScreens = [
    ProductScreen(),
    CategoryScreen(),
    FavouriteScreen(),
    SettingScreen(),
  ];
  void changeBottom(int index){
    currentIndex = index;
    emit(ShopHomeChangeBottomNavState());
  }

  HomeModel? homeModel;
  Map<int, bool> favourites = {};

  void getHomeData(){
    emit(ShopHomeLoadingState());
    DioHelper.getData(url: HOME,
    token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      print(homeModel?.status);
      printFullText(homeModel.toString());
      homeModel?.data.products.forEach((element) {
        favourites.addAll({
          element.id : element.inFavorites
        });
      });
      emit(ShopHomeSuccessState());
    }
    ).catchError((error){
      print(error.toString());
      emit(ShopHomeErrorState());
  });
  }

  CategoryModel? categoryModel;
  void getCategoryData(){
    //emit(ShopHomeLoadingState());
    DioHelper.getData(url: GET_CATEGORIES,
      token: token,
    ).then((value) {
      categoryModel = CategoryModel.fromJson(value.data);
      print(homeModel?.status);
      printFullText(homeModel.toString());
      emit(ShopHomeCategorySuccessState());
    }
    ).catchError((error){
      print(error.toString());
      emit(ShopHomeCategoryErrorState());
    });
  }

  FavouritesModel? favouritesModel;
  void changeFavourites(int id){
    favourites[id] = !favourites[id]!;
    emit(ShopHomeChangeFavouritesState());

    DioHelper.getData(
        url: FAVORITES,
      data: {
          'product_id' : id
        },
      token: token
    ).then((value) {
      favouritesModel = FavouritesModel.fromJson(value.data);
      if (!favouritesModel!.status){
        favourites[id] = !favourites[id]!;
      }else{
        getFavouriteData();
      }
      emit(ShopHomeChangeFavouritesSuccessState(favouritesModel!));
    }).catchError((error){
      favourites[id] = !favourites[id]!;
      emit(ShopHomeChangeFavouritesErrorState());
    });
  }

  GetFavouritesModel? getFavouritesModel;
  void getFavouriteData(){
    DioHelper.getData(url: FAVORITES,
      token: token,
    ).then((value) {
      getFavouritesModel = GetFavouritesModel.fromJson(value.data);
      print(getFavouritesModel?.status);
      printFullText(getFavouritesModel.toString());
      emit(ShopHomeGetFavouritesSuccessState());
    }
    ).catchError((error){
      print(error.toString());
      emit(ShopHomeGetFavouritesErrorState());
    });
  }

  LoginModel? loginModel;
  void getUserData(){
    emit(ShopHomeUserDataLoadingState());
    DioHelper.getData(url: PROFILE,
      token: token,
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print(getFavouritesModel?.status);
      printFullText(loginModel!.data!.name);
      emit(ShopHomeUserDataSuccessState(loginModel!));
    }
    ).catchError((error){
      print(error.toString());
      emit(ShopHomeUserDataErrorState());
    });
  }

  void updateUserData({
  required String name,
  required String email,
  required String phone,
}){
    emit(ShopHomeUserDataLoadingState());
    DioHelper.putData(url: UPDATE_PROFILE,
      token: token,
      data: {
      'name' : name,
      'email' : email,
      'phone' : phone,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print(getFavouritesModel?.status);
      printFullText(loginModel!.data!.name);
      emit(ShopHomeUserDataSuccessState(loginModel!));
    }
    ).catchError((error){
      print(error.toString());
      emit(ShopHomeUserDataErrorState());
    });
  }

}