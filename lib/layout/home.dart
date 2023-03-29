import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/layout/drower.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    // var cubit = HomeBodyCubit.get(context);
    return BlocProvider(
      create: (BuildContext context) => HomeBodyCubit()..createDataBase(),
      child: BlocConsumer<HomeBodyCubit, HomeBodyStates>(
        listener: (context, state) {
          if (state is BottomNavAppBarChangeStates) {
            print("yooooo niggga ");
          }
        },
        builder: (context, state) {
          HomeBodyCubit  cubit = HomeBodyCubit.get(context);
          print(" i am in home ");
          print("the farmers are  ${cubit.farmer}");
          return Scaffold(
              drawer: Drawer(child: AppDrawer()),
              bottomNavigationBar: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[


                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'المزارعين',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.newspaper),
                    label: 'كشف',
                  ),
                ],
                selectedItemColor: Colors.amber[800],
                onTap: (index) {
                  cubit.changeIndex(index);
                },
                currentIndex: cubit.screenIndex,
              ),
              appBar: AppBar(
                title: const Text('الرئيسية'),
              ),

              body: cubit.screen[cubit.screenIndex]
              // This trailing comma makes auto-formatting nicer for build methods.
              );
        },
      ),
    );
  }
}
