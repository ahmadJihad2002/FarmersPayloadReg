import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';

Widget tage(
    {required quantity, required name, required receiver, required note, required hour,required int index}) {

  return BlocConsumer<HomeBodyCubit, HomeBodyStates>(
    listener: (context, state) {},
    builder: (context, state) {
      print(" i am inside farmer list view builder");
      HomeBodyCubit cubit = HomeBodyCubit.get(context);
      print(cubit.farmer);

      return Card(
        elevation: 0.8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
               mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text('$index,$name, $quantity, $receiver, $hour, $note'),
              ],
            ),
          ),
        ),
      );
    },
  );





}
