import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/layout/home_cubit/cubit.dart';
import 'package:e_commerce/layout/home_cubit/states.dart';
import 'package:e_commerce/modules/login_screen/login_screen.dart';
import 'package:e_commerce/shared/local/shared_preferences.dart';
import 'package:e_commerce/shared/widgets/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SettingScreen extends StatelessWidget {
   SettingScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopHomeCubit, ShopHomeStates>(
      listener: (context, state){
        if (state is ShopHomeUserDataSuccessState){
          nameController.text = state.loginModel.data!.name;
          emailController.text = state.loginModel.data!.email;
          phoneController.text = state.loginModel.data!.phone;
        }
      },
      builder: (context, state){
        var model = ShopHomeCubit.get(context).loginModel!.data;
        nameController.text = model!.name;
        emailController.text = model.email;
        phoneController.text = model.phone;

        return ConditionalBuilder(
          condition: ShopHomeCubit.get(context).loginModel != null,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    if (state is  ShopHomeUpdateUserDataLoadingState)
                      LinearProgressIndicator()
                    ,
                    SizedBox(
                      height: 10.0,
                    ),
                    customTextFormField(
                        controller: nameController,
                        type: TextInputType.name,
                        label: 'Your Name',
                        prefix: Icons.person_outline
                    ),
                    SizedBox(height: 10.0,),
                    customTextFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        label: 'E-mail Address',
                        prefix: Icons.email_outlined
                    ),
                    SizedBox(height: 10.0,),
                    customTextFormField(
                        controller: phoneController,
                        type: TextInputType.phone,
                        label: 'Your Phone',
                        prefix: Icons.phone
                    ),
                    SizedBox(height: 20.0,),
                    customBtn(onPressed: (){
                      if (formKey.currentState!.validate()){
                        ShopHomeCubit.get(context).updateUserData(
                            name: nameController.text,
                            email: emailController.text,
                            phone: phoneController.text
                        );
                      }
                    }, text: 'UPDATE'),
                    SizedBox(height: 10.0,),
                    customBtn(onPressed: (){
                      CacheHelper.removeData(key: 'token').then((value) {
                        if(value){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                                (route) {
                              return false;
                            },
                          );
                        }
                      });
                    }, text: 'LOGOUT'),
                  ],
                ),
              ),
            );
          },
          fallback: (BuildContext context) {
            return CircularProgressIndicator();
          },
        );
      },
    );
  }
}
