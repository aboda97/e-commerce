import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/layout/Home_cubit.dart';
import 'package:e_commerce/modules/login_screen/login_cubit/login_cubit.dart';
import 'package:e_commerce/modules/register_screen/register_cubit/register_cubit.dart';
import 'package:e_commerce/modules/register_screen/register_cubit/register_states.dart';
import 'package:e_commerce/shared/constants.dart';
import 'package:e_commerce/shared/local/shared_preferences.dart';
import 'package:e_commerce/shared/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class RegisterScreen extends StatelessWidget {
  static String id = 'Register';
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (BuildContext context, state) {
          if (state is ShopRegisterSuccessState){
            if(state.loginModel.status){
              print(state.loginModel.message);
              print(state.loginModel.data?.token);
              CacheHelper.saveData(key: 'token', value: state.loginModel.data?.token).then((value){
                showToast(text: state.loginModel.message, state: ToastStates.SUCCESS);
                token = state.loginModel.data!.token;
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                      (route) {
                    return false;
                  },
                );
              });
            }else{
              print(state.loginModel.message);
              showToast(text: state.loginModel.message, state: ToastStates.ERROR);
            }
          }
        },
        builder: (BuildContext context, Object? state) {
          return  Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'REGISTER',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Hi, Register and Join to us',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        customTextFormField(
                            controller: nameController,
                            type: TextInputType.name,
                            label: 'Your Name',
                            prefix: Icons.person_outline),
                        SizedBox(
                          height: 10.0,
                        ),
                        customTextFormField(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            label: 'E-Mail Address',
                            prefix: Icons.email_outlined),
                        SizedBox(
                          height: 10.0,
                        ),
                        customTextFormField(
                            isPassword: ShopRegisterCubit.get(context).isPassWord,
                            suffix: ShopRegisterCubit.get(context).suffix,
                            suffixPressed: () {
                              ShopLoginCubit.get(context).changePasswordVisibility();
                            },
                            controller: passController,
                            type: TextInputType.visiblePassword,
                            onSubmit: (value){
                              // if (formKey.currentState!.validate()){
                              //   ShopLoginCubit.get(context).userLogin(
                              //       email: emailController.text,
                              //       password: passController.text
                              //   );
                              //   //   Navigator.pushReplacementNamed(context, HomeScreen.id);
                              // }
                            },
                            label: 'Password',
                            prefix: Icons.lock_outline),
                        SizedBox(
                          height: 10.0,
                        ),
                        customTextFormField(
                            controller: phoneController,
                            type: TextInputType.phone,
                            label: 'Your Phone',
                            prefix: Icons.phone),
                        SizedBox(
                          height: 10.0,
                        ),
                        ConditionalBuilder(
                          condition: state is !ShopRegisterLoadingState,
                          builder: (BuildContext context) {
                            return customBtn(
                                onPressed: () {
                                  if (formKey.currentState!.validate()){
                                    ShopRegisterCubit.get(context).userRegister(
                                        email: emailController.text,
                                        password: passController.text,
                                        name: nameController.text,
                                        phone: phoneController.text
                                    );
                                    //   Navigator.pushReplacementNamed(context, HomeScreen.id);
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ),
                                          (route) {
                                        return false;
                                      },
                                    );
                                  }
                                }, text: 'REGISTER');
                          },
                          fallback: (BuildContext context) {
                            return Center(child: CircularProgressIndicator());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
