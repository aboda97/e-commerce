import 'package:e_commerce/layout/home_cubit/cubit.dart';
import 'package:e_commerce/layout/home_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopHomeCubit, ShopHomeStates>(
      listener: (context, state){},
      builder: (context, state){
        return ListView.separated(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Image(image: NetworkImage(ShopHomeCubit.get(context).categoryModel!.data.data[index].image),
                    width: 120.0,
                    height: 120.0,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 20.0,),
                  Text(ShopHomeCubit.get(context).categoryModel!.data.data[index].name,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Spacer(),
                  IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios))
                ],
              ),
            ),
            separatorBuilder:(context, index)=> SizedBox(
              height: 5.0,
            ),
            itemCount: ShopHomeCubit.get(context).categoryModel!.data.data.length
        );
      },
    );
  }
}
