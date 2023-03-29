import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled/layout/drower.dart';
import 'package:untitled/shared/components/farmerListCards.dart';
import 'package:untitled/shared/components/inputField.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';

class Farmers extends StatelessWidget {
  const Farmers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name1 = TextEditingController();
    var name2 = TextEditingController();
    final formKey = GlobalKey<FormState>();
    double height = (MediaQuery.of(context).size.height);
    var scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocProvider(
        create: (BuildContext context) => HomeBodyCubit()..createDataBase(),
        child: BlocConsumer<HomeBodyCubit, HomeBodyStates>(
          listener: (context, state) {},
          builder: (context, state) {
            print(" i am inside farmer list view builder");
            HomeBodyCubit cubit = HomeBodyCubit.get(context);
            print(cubit.farmer);

            return Scaffold(
              drawer: Drawer(child: AppDrawer()),
              appBar: AppBar(
                title: const Text('الرئيسية'),
              ),
              key: scaffoldKey,
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  cubit.changeButtonIcon();
                  if (cubit.isButtonSheetOpened) {
                    if (formKey.currentState!.validate()) {
                      cubit.insertToDataBase(
                          name1: name1.text,
                          name2: name2.text,
                          date: DateFormat.yMd().format(DateTime.now()));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            dismissDirection: DismissDirection.up,
                            elevation: 120,
                            content: Text('تم الاضافة بنجاح')),
                      );
                      Navigator.pop(context);
                    }

                    cubit.isButtonSheetOpened = false;
                  } else {



                    cubit.isButtonSheetOpened = true;

                    scaffoldKey.currentState
                        ?.showBottomSheet((context) => SizedBox(
                              height: height / 3,
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
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
                                    ],
                                  ),
                                ),
                              ),
                            ));
                  }
                },
                child: Icon(cubit.buttonSheetIcon),
              ),
              body: ListView.builder(
                  itemCount: cubit.farmer.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FarmerListCards(
                      farmerName: cubit.farmer[index]["name1"],
                      farmerIndex: index,
                    );
                  }),
            );
          },
        ));
  }
}
