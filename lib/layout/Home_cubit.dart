import 'package:e_commerce/layout/home_cubit/cubit.dart';
import 'package:e_commerce/layout/home_cubit/states.dart';
import 'package:e_commerce/modules/search_screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id = 'Home';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopHomeCubit, ShopHomeStates>(
        listener: (BuildContext context, state) {  },
    builder: (BuildContext context, state) {

          var shopHomeCubit = ShopHomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('E-Commerce App',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue
              ),
              ),
              actions: [
                IconButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchScreen(),
                    ),
                  );
                }, icon: Icon(Icons.search)),
              ],
            ),
            body: shopHomeCubit.bottomNavScreens[shopHomeCubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              elevation: 20.0,
              backgroundColor: Color(0xff333739),
              onTap: (index){
                shopHomeCubit.changeBottom(index);
              },
              currentIndex: shopHomeCubit.currentIndex, //علشان لما ادوس يتنقل
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home),
                label: 'Home'
                ),
                BottomNavigationBarItem(icon: Icon(Icons.category),
                label: 'Category'
                ),
                BottomNavigationBarItem(icon: Icon(Icons.favorite),
                label: 'Favourite'
                ),
                BottomNavigationBarItem(icon: Icon(Icons.settings),
                label: 'Setting'
                ),
              ],
            ),
          );
    },
    );
  }
}
