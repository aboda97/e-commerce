import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/layout/home_cubit/cubit.dart';
import 'package:e_commerce/layout/home_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FavouriteScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<ShopHomeCubit, ShopHomeStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ConditionalBuilder(
          condition: state is! ShopHomeGetFavouritesLoadingState,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 120.0,
                child: Row(
                  children: [
                    Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        Image(
                          image: NetworkImage(ShopHomeCubit.get(context).getFavouritesModel!.data.data[index].product.image),
                          width: 120.0,
                          height: 120.0,
                        ),
                        if (ShopHomeCubit.get(context).getFavouritesModel!.data.data[index].product.discount != 0)
                          Container(
                            color: Colors.red,
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.0,
                            ),
                            child: Text(
                              'DISCOUNT',
                              style: TextStyle(
                                fontSize: 8.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ShopHomeCubit.get(context).getFavouritesModel!.data.data[index].product.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 18.0,
                              height: 1.3,
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              Text(
                                ShopHomeCubit.get(context).getFavouritesModel!.data.data[index].product.price.toString(),
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              if (ShopHomeCubit.get(context).getFavouritesModel!.data.data[index].product.discount != 0)
                                Text(
                                  ShopHomeCubit.get(context).getFavouritesModel!.data.data[index].product.oldPrice.toString(),
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.red,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  ShopHomeCubit.get(context).changeFavourites(ShopHomeCubit.get(context).getFavouritesModel!.data.data[index].product.id);
                                },
                                icon: Icon(
                                  ShopHomeCubit.get(context).favourites[ShopHomeCubit.get(context).getFavouritesModel!.data.data[index].product.id]! ? Icons.favorite : Icons.favorite_outline,
                                  size: 24.0,
                                  color: ShopHomeCubit.get(context).favourites[ShopHomeCubit.get(context).getFavouritesModel!.data.data[index].product.id]! ? Colors.red : Colors.blue ,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsetsDirectional.only(
                start: 20.0,
              ),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            itemCount: ShopHomeCubit.get(context).getFavouritesModel!.data.data.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}


