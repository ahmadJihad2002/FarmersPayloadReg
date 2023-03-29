import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';

class Report extends StatelessWidget {
  const Report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBodyCubit, HomeBodyStates>(
      listener: (context, state) {},
      builder: (context, state) {
        print(" i am inside farmer list view builder");
        HomeBodyCubit cubit = HomeBodyCubit.get(context);
        print(cubit.farmer);

        return Scaffold(
          body: Column(
            children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: const [
               Text('الصنف'),
               Text('االعدد'),
               Text('مكان التنزيل'),
               Text('الساعة'),
               Text('التاريخ'),
               Text('الصنف'),
               Text('الصنف'),

             ],),

              SizedBox(
                height: 100,
                child: ListView.builder(
                    itemCount: cubit.payload.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:   [
                          Text('${cubit.payload[index]['payloadId']}',overflow: TextOverflow.values.first,),
                          Text('${cubit.payload[index]['category']}'),
                          Text('${cubit.payload[index]['quantity']}'),
                          Text('${cubit.payload[index]['place']}'),
                          Text('${cubit.payload[index]['note']}'),
                          Text('${cubit.payload[index]['date']}',overflow: TextOverflow.values.first),
                          Text('${cubit.payload[index]['hour']}'),


                        ],) ;
                    }),
              ),



            ],
          ),
        );
      },
    );
  }
}
