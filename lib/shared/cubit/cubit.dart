import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled/modules/Report.dart';
import 'package:untitled/modules/addNewBill.dart';
import 'package:untitled/modules/farmerInfo.dart';
import 'package:untitled/shared/cubit/states.dart';

class HomeBodyCubit extends Cubit<HomeBodyStates> {
  HomeBodyCubit() : super(HomeBodyInitialStates());

  static HomeBodyCubit get(context) => BlocProvider.of(context);
  int screenIndex = 0;
  List screen = [
    AddNewBill(),
    Report(),
    FarmerInfo(),
  ];
  void changeIndex(int index) {
    screenIndex = index;
    emit(BottomNavAppBarChangeStates());
  }

//for addNewBill
  var hisba = [
    "العسلي",
    "ابو نائل",
    "ابو خلف",
    "او الحلاوة",
  ];
  var categoryName = [
    "خيار",
    "سبانخ",
    "بندورة",
    "فاصولياء",
  ];
  String dropDownValue1 = "خيار";
  String dropDownValue = "العسلي";
  int quantity = 0;


  List<Widget> tags = [];
  int farmerId = 0;
  List payload = [];

  void addToCardTags(Widget tage) {
    tags.add(tage);
    emit(AddToCardTagsState());
  }

  void deleteFromCardTags() {
    if (tags.isNotEmpty) {
      tags.removeLast();
    }

    emit(DeleteFromCardTagsState());
  }

  void changeDropBottomValue(String value) {
    dropDownValue = value;
    emit(AddBillChangeState());
  }

  void changeDropBottomValue1(String value) {
    dropDownValue1 = value;
    emit(AddBillChangeState());
  }

  bool isButtonSheetOpened = false;
  IconData buttonSheetIcon = Icons.edit;

  void changeButtonIcon() {
    if (isButtonSheetOpened) {
      buttonSheetIcon = Icons.edit;
    } else {
      buttonSheetIcon = Icons.add;
    }
    emit(ChangeButtonIconState());
  }

  // to add the shipment to the card

  late Database database;
  List<Map> farmer = [];

  void createDataBase() {
    openDatabase(
      'farmer.db',
      version: 1,
      onCreate: (Database database, int version) {
        // creating the first table
        database
            .execute(
              'CREATE TABLE Farmers  (farmerId INTEGER PRIMARY KEY, name1 TEXT, name2 TEXT, date TEXT)',
            )
            .then((value) {})
            .catchError((error) {
          print('Error when creating farmer table ${error.toString()}');
        });
        database
            .execute(
              'CREATE TABLE Payload (payloadId INTEGER PRIMARY KEY,category TEXT, quantity TEXT, place TEXT,note TEXT,date TEXT,hour TEXT,farmer_id INT, FOREIGN KEY (farmer_id) REFERENCES Farmers(farmerId))',
            )
            .then((value) {})
            .catchError((error) {
          print('Error when creating payload table base ${error.toString()}');
        });
        ;
        //creating the second table
      },
      onOpen: (database) {
        getDataFromDataBase(database).then((value) {
          emit(GetDataFromDataBase());
          print("data base base is opened and assigned  ");
          farmer = value;
        });

        getDataFromPayloadTable(database).then((value) {
          emit(GetDataFromPayloadTableState());
          print("data base base is opened and payload is assigned  ");
          print(value);
          payload = value;
        });
      },
    ).then((value) {
      database = value;
      emit(CreateDataBase());
    });
  }

  insertToDataBase(
      {required String name1,
      required String name2,
      required String date}) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO Farmers(name1, name2, date) VALUES("$name1","$name2","$date") ',
      )
          .then((value) {
        emit(InsertDataBase());

        getDataFromDataBase(database).then((value) {
          emit(GetDataFromDataBase());
          farmer = value;
        });
        print('data been inserted successfully ');
        print(farmer);
      }).catchError((error) {
        print(' some thing went ronge: ${error.toString()}');
      });
      null;
    }).then((value) async {
      farmer = await getDataFromDataBase(database);
      emit(InsertDataBase());
    });
  }

  insertToPayloadTable({
    required String quantity,
    required String place,
    required String hour,
    required String category,
    required int farmerId,
    required String date,
    required String note,
  }) async {
    await database.transaction((txn) async {
      txn
          .rawInsert(
        'INSERT INTO  Payload (category,quantity,place,note,date,hour,farmer_id) VALUES("$category","$quantity","$place","$note","$date","$hour","$farmerId") ',
      )
          .then((value) {
        emit(InsertToPayloadTableState());

        getDataFromPayloadTable(database).then((value) {
          emit(GetDataFromPayloadTableState());
          // farmer = value;
        });
        print('data been inserted from payload  successfully ');
      }).catchError((error) {
        print(' some thing went ronge: ${error.toString()}');
      });
      null;
    }).then((value) async {
      farmer = await getDataFromDataBase(database);
      emit(InsertDataBase());
    });
  }

  Future<List<Map>> getDataFromDataBase(database) async {
    List<Map> farmers = await database.rawQuery('SELECT * FROM Farmers');
    farmer = farmers;
    return farmers;
  }

  Future<List<Map>> getDataFromPayloadTable(database) async {
    List<Map> payloads = await database.rawQuery('SELECT * FROM Payload');
    print(' payload in the data base ');
    print(payloads);
    payload = payloads;
    emit(AddToPayLoad());
    return payloads;
  }
}
