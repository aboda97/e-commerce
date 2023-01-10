import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:e_commerce/layout/home_cubit/cubit.dart';
import 'package:e_commerce/layout/home_cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopHomeCubit, ShopHomeStates>(
      listener: (context, state){},
      builder: (context, state){
        return ConditionalBuilder(
          condition: ShopHomeCubit.get(context).homeModel != null && ShopHomeCubit.get(context).categoryModel != null,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider(
                        items: ShopHomeCubit.get(context).homeModel?.data.banners.map((e)
                        =>Image(image: NetworkImage('${e.image}'),
                        width: double.infinity,
                          fit: BoxFit.cover,
                        ) ).toList(),
                        options: CarouselOptions(
                          height: 250.0,
                          viewportFraction: 1.0,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 5),
                          autoPlayAnimationDuration: Duration(seconds: 2),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          scrollDirection: Axis.horizontal,
                        )
                    ),
                    SizedBox(height: 10.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('CATEGORIES',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                    ),
                    Container(
                      height: 100.0,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Stack(
                            alignment: AlignmentDirectional.bottomCenter,
                            children: [
                              Image(image: NetworkImage(ShopHomeCubit.get(context).categoryModel!.data.data[index].image),
                                height: 100.0,
                                width: 100.0,
                                fit: BoxFit.cover,
                              ),
                              Container(
                                color: Colors.black.withOpacity(.8),
                                width: 100.0,
                                child: Text(ShopHomeCubit.get(context).categoryModel!.data.data[index].name,
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                ),
                              ),
                            ],
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            width: 10.0,
                          ),
                          itemCount: ShopHomeCubit.get(context).categoryModel!.data.data.length
                      ),
                    ),
                    SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('PRODUCTS',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey[100],
                      child: GridView.count(
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        childAspectRatio:1/1.5,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        children: List.generate(
                              ShopHomeCubit.get(context).homeModel!.data.products.length,
                                (index) => Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment: AlignmentDirectional.bottomStart,
                                        children: [
                                          Image(image: NetworkImage(ShopHomeCubit.get(context).homeModel!.data.products[index].image),
                                          width: double.infinity,
                                            height: 200,
                                            //fit: BoxFit.contain,
                                          ),
                                          if (ShopHomeCubit.get(context).homeModel!.data.products[index].discount != 0)
                                            Container(
                                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                                              color: Colors.blue,
                                              child: Text('Dicount',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                      Text(
                                          ShopHomeCubit.get(context).homeModel!.data.products[index].name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          height: 1.4,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${ShopHomeCubit.get(context).homeModel!.data.products[index].price.round()} EGP',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 12.0,
                                                color: Colors.blue
                                            ),
                                          ),
                                          SizedBox(width: 10.0,),
                                          if (ShopHomeCubit.get(context).homeModel!.data.products[index].discount != 0)
                                            Text(
                                              '${ShopHomeCubit.get(context).homeModel!.data.products[index].oldPrice.round()} EGP',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 12.0,
                                                  color: Colors.red,
                                                  decoration: TextDecoration.lineThrough
                                              ),
                                            ),
                                          Spacer(),
                                          IconButton(
                                              onPressed: (){
                                                ShopHomeCubit.get(context).changeFavourites(ShopHomeCubit.get(context).homeModel!.data.products[index].id);
                                              },
                                              icon: Icon(
                                                ShopHomeCubit.get(context).favourites[ShopHomeCubit.get(context).homeModel?.data.products[index].id]! ? Icons.favorite : Icons.favorite_outline,
                                              size: 24.0,
                                                color:ShopHomeCubit.get(context).favourites[ShopHomeCubit.get(context).homeModel?.data.products[index].id]! ? Colors.red : Colors.blue ,
                                              ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                        )

                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          fallback: (BuildContext context) => Center(
              child: CircularProgressIndicator()
          ),
        );
      },
    );
  }
}
