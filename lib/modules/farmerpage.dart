import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';

class FarmerPage extends StatelessWidget {
  const FarmerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBodyCubit()..createDataBase(),
      child: BlocConsumer<HomeBodyCubit, HomeBodyStates>(
        listener: (context, state) {},
        builder: (context, state) {
          print(" i am inside farmer list view builder");
          HomeBodyCubit cubit = HomeBodyCubit.get(context);
          print(cubit.farmer);

          return Scaffold(
            appBar: AppBar(),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'اضافة',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.newspaper),
                  label: 'كشف',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.info),
                  label: 'حول',
                ),
              ],
              selectedItemColor: Colors.amber[800],
              onTap: (index) {
                cubit.changeIndex(index);
              },
              currentIndex: cubit.screenIndex,
            ),
            body: cubit.screen[cubit.screenIndex],
          );
        },
      ),
    );
  }
}
