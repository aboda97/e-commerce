import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/layout/Home_cubit.dart';
import 'package:e_commerce/modules/login_screen/login_cubit/login_cubit.dart';
import 'package:e_commerce/modules/login_screen/login_cubit/login_states.dart';
import 'package:e_commerce/modules/register_screen/register_screen.dart';
import 'package:e_commerce/shared/constants.dart';
import 'package:e_commerce/shared/local/shared_preferences.dart';
import 'package:e_commerce/shared/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  static String id = 'Login';

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=> ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (context, state) {
          if (state is ShopLoginSuccessState){
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
        builder: (context, state) {
          return Scaffold(
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
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Hi, Login and Ask for The Newest Offers',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
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
                            isPassword: ShopLoginCubit.get(context).isPassWord,
                            suffix: ShopLoginCubit.get(context).suffix,
                            suffixPressed: () {
                              ShopLoginCubit.get(context).changePasswordVisibility();
                            },
                            controller: passController,
                            type: TextInputType.visiblePassword,
                            onSubmit: (value){
                              if (formKey.currentState!.validate()){
                                ShopLoginCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passController.text
                                );
                                //   Navigator.pushReplacementNamed(context, HomeScreen.id);
                              }
                            },
                            label: 'Password',
                            prefix: Icons.lock_outline),
                        SizedBox(
                          height: 10.0,
                        ),
                        ConditionalBuilder(
                          condition: state is !ShopLoginLoadingState,
                          builder: (BuildContext context) {
                            return customBtn(
                                onPressed: () {
                                  if (formKey.currentState!.validate()){
                                    ShopLoginCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passController.text
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
                                }, text: 'LOGIN');
                          },
                          fallback: (BuildContext context) {
                            return Center(child: CircularProgressIndicator());
                          },
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Don\'t Have an Account ?'),
                            TextButton(
                              onPressed: () {
                               // Navigator.pushNamed(context, RegisterScreen.id);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterScreen(),
                                  ),
                                );
                              },
                              child: Text('Register Now'),
                            ),
                          ],
                        )
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
