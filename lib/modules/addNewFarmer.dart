import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled/shared/components/inputField.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';

class AddNewFarmer extends StatelessWidget {
  const AddNewFarmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeBodyCubit()..createDataBase(),
      child: BlocConsumer<HomeBodyCubit, HomeBodyStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var name1 = TextEditingController();
          var name2 = TextEditingController();
          final formKey = GlobalKey<FormState>();
            HomeBodyCubit cubit = HomeBodyCubit.get(context);
          print("i am inside add new farmer  ");
          // print(cubit.farmer);
          return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          inputField(
                            controller: name1,
                            label: const Text("الإسم"),
                            validate: (value) {
                              if (value.isEmpty) {
                                return "قم بإدخال الاسم بالأول";
                              }
                            },
                            type: TextInputType.text,
                            hintText: 'الإسم الأول',
                            icon: Icons.add,
                          ),
                          inputField(
                            controller: name2,
                            label: const Text(" اسم العائلة"),
                            validate: (value) {
                              if (value.isEmpty) {
                                return "قم بإدخال اسم العائلة";
                              }
                            },
                            type: TextInputType.text,
                            hintText: 'nigga',
                            icon: Icons.add,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, or false otherwise.
                              if (formKey.currentState!.validate()) {
                                cubit.insertToDataBase(
                                    name1: name1.text,
                                    name2: name2.text,
                                    date:
                                        DateFormat.yMd().format(DateTime.now()));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      dismissDirection: DismissDirection.up,
                                      elevation: 120,
                                      content: Text('تم الاضافة بنجاح')),
                                );
                               name1.clear();
                               name2.clear();
                                Navigator.pop(context);
                              }
                            },
                            child: const Text('Submit'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));

        },
      ),
    );
  }
}
