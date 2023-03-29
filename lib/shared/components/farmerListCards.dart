import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';

class FarmerListCards extends StatelessWidget {
  const FarmerListCards(
      {Key? key, required this.farmerName, required this.farmerIndex})
      : super(key: key);
  final String farmerName;
  final int farmerIndex;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBodyCubit, HomeBodyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeBodyCubit cubit = HomeBodyCubit.get(context);

        return Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: InkWell(
            onTap: () {
              cubit.farmerId = farmerIndex;
              print('you pressed the index');
              print(farmerIndex);
              Navigator.pushNamed(context, '/farmerPage');
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.height / 10,
                    backgroundImage:
                        const AssetImage('assets/img/farmerImg.webp'),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(" $farmerIndex"),
                          Text("name:"),
                          Text("\t $farmerName"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
