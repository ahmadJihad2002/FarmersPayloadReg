import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/cubit/cubit.dart';
import 'package:untitled/shared/cubit/states.dart';
import 'package:input_quantity/input_quantity.dart';

class AddNewBill extends StatefulWidget {
  const AddNewBill({Key? key}) : super(key: key);

  @override
  State<AddNewBill> createState() => _AddNewBillState();
}

class _AddNewBillState extends State<AddNewBill> {
  TextEditingController notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return BlocConsumer<HomeBodyCubit, HomeBodyStates>(
        listener: (context, state) {
      if (state is AddBillChangeState) {
        print("drop down been changed ");
      }
    }, builder: (context, state) {
      HomeBodyCubit cubit = HomeBodyCubit.get(context);
      int quantity = 0;
      String category = cubit.dropDownValue1;
      String seler = cubit.dropDownValue;
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            height: height / 1.3,
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    const Text(" مكان التنزيل "),
                    const SizedBox(
                      width: 20,
                    ),
                    DropdownButton(
                      value: cubit.dropDownValue,
                      onChanged: (String? newValue) {
                        cubit.changeDropBottomValue(newValue!);
                      },
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: cubit.hisba.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    const Text(" الصنف "),
                    const SizedBox(
                      width: 20,
                    ),
                    DropdownButton(
                      value: cubit.dropDownValue1,
                      onChanged: (String? newValue) {
                        cubit.changeDropBottomValue1(newValue!);
                        category = newValue;
                      },
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: cubit.categoryName.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    const Text(" :الكمية"),
                    const SizedBox(width: 10),
                    InputQty(
                      btnColor1: Colors.black,
                      btnColor2: Colors.black,
                      onQtyChanged: (value) {
                        quantity = value as int;
                      },
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all()),
                  child: TextField(
                    controller: notes,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5,
                    decoration: const InputDecoration(
                      hintText: "اضافة ملاحظة ",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: 120,
                    child: ListView.builder(
                        // itemCount: cubit.tags.length,
                        itemCount: cubit.tags.length,
                        itemBuilder: (BuildContext context, int index) {
                          print(cubit.tags[index]);
                          return cubit.tags[index];
                        }),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        cubit.payload.add([
                          quantity,
                          seler,
                          DateTime.now().hour,
                          category,
                          DateTime.now(),
                          notes.text
                        ]);
                        cubit.addToCardTags(tage(
                            index: cubit.tags.length,
                            quantity: quantity,
                            name: category,
                            receiver: seler,
                            hour: DateTime.now().hour,
                            note: notes.text));
                      },
                      child: const Text('  اضافة '),
                    ),
                    const SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        cubit.deleteFromCardTags();
                      },
                      child: const Text(' حذف '),
                    )
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Tages length ');
                    print(cubit.tags.length);
                    for (int i = 0; i < cubit.tags.length; i++) {
                      cubit.insertToPayloadTable(
                        quantity: cubit.payload[i][0].toString(),
                        place: cubit.payload[i][1],
                        hour: cubit.payload[i][2].toString(),
                        category: cubit.payload[i][3],
                        farmerId: cubit.farmerId,
                        date: cubit.payload[i][4].toString(),
                        note: cubit.payload[i][5],
                      );
                    }
                  },
                  child: const Text('ترحيل'),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
