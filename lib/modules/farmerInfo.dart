import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';

class FarmerInfo extends StatelessWidget {
  const FarmerInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBodyCubit, HomeBodyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeBodyCubit cubit = HomeBodyCubit.get(context);

        return Scaffold(
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.height / 10,
                    backgroundImage:
                        const AssetImage('assets/img/farmerImg.webp'),
                  ),
                  Column(
                    textDirection: TextDirection.rtl,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(":الاسم"),
                      Text(":تاريخ الاضافة"),
                      Text(":مجموع"),
                      Text(":تاريخ آخر حمولة"),
                      Text(':آخر حمولة'),
                    ],
                  ),
                ]),
          ),
        );
      },
    );
  }
}
