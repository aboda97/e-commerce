import 'package:e_commerce/models/login_model.dart';
import 'package:e_commerce/modules/login_screen/login_cubit/login_states.dart';
import 'package:e_commerce/shared/end_points.dart';
import 'package:e_commerce/shared/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);  //here i create object from bloc
  LoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
}){
    emit(ShopLoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data: {
          'email' : email,
          'password' : password,
        }).then((value){
          loginModel = LoginModel.fromJson(value.data);  //كدا هو جاهز اني اخد منه object
          print(loginModel?.message);
          print(loginModel?.data?.token);
          emit(ShopLoginSuccessState(loginModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }



    IconData suffix = Icons.visibility_outlined;
    bool isPassWord = true;
    void changePasswordVisibility() {
      isPassWord = !isPassWord;
      suffix = isPassWord ? Icons.visibility_outlined : Icons.visibility_off_outlined ;
      emit(ShopChangePassVisibilityState());
    }
  }

