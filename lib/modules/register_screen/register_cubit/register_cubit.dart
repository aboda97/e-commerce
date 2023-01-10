import 'package:e_commerce/models/login_model.dart';
import 'package:e_commerce/modules/register_screen/register_cubit/register_states.dart';
import 'package:e_commerce/shared/end_points.dart';
import 'package:e_commerce/shared/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);  //here i create object from bloc
  LoginModel? loginModel;

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
}){
    emit(ShopRegisterLoadingState());
    DioHelper.postData(
        url: REGISTER,
        data: {
          'email' : email,
          'password' : password,
          'name' : name,
          'phone' : phone,
        }).then((value){
          loginModel = LoginModel.fromJson(value.data);  //كدا هو جاهز اني اخد منه object
          print(loginModel?.message);
          print(loginModel?.data?.token);
          emit(ShopRegisterSuccessState(loginModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
    });
  }



    IconData suffix = Icons.visibility_outlined;
    bool isPassWord = true;
    void changePasswordVisibility() {
      isPassWord = !isPassWord;
      suffix = isPassWord ? Icons.visibility_outlined : Icons.visibility_off_outlined ;
      emit(RegisterChangePassVisibilityState());
    }
  }

