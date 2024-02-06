import 'dart:io';

import 'package:budget_tracker/modals/transaction_modal.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();

  static final DbHelper dbHelper = DbHelper._();

  late Database database;
  Logger logger = Logger();

  String trTable = "TransactionTable";
  String trId = "id";
  String trTitle = "title";
  String trAmount = "amount";
  String trType = "type";
  String trDate = "date";
  String trCategory = "category";
  String trCategoryImage = "categoryImage";

  String blTable = "Balance";
  String blId = "id";
  String blAmount = "amount";

  String query = "";

  Future<void> init() async {
    String dbPath = Platform.isAndroid
        ? Directory('/storage/emulated/0/Download/allDBs').path
        : (await getDownloadsDirectory())!.path;

    String path = join(dbPath, 'db1.db');

    logger.d("DB PATH: $dbPath");

    database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, ver) {
        query =
            '''CREATE TABLE IF NOT EXISTS $trTable($trId INTEGER PRIMARY KEY AUTOINCREMENT,$trTitle TEXT NOT NULL,$trType TEXT CHECK($trType IN('income','expanse')),$trDate INTEGER DEFAULT 0,$trCategory TEXT,$trCategoryImage BLOB''';

        db
            .execute(query)
            .then((value) => logger.i("Transaction Table Created..."))
            .onError((error, stackTrace) => logger.e("ERROR: $error"));

        query =
            "CREATE TABLE $blTable($blId INTEGER PRIMARY KEY,$blAmount INTEGER)";

        db
            .execute(query)
            .then((value) => logger.i("Balance Table Created..."))
            .onError((error, stackTrace) => logger.e("ERROR: $error"));
      },
    );
  }

  Future<void> insertTransaction(
      {required TransactionModal transactionModal}) async {
    Map<String, dynamic> data = transactionModal.toMap;

    data.remove('id');

    logger.i("DATA: $data");

    await database.insert(trTable, data);
  }

  Future<List<TransactionModal>> getTransactions() async {
    query = "SELECT * FROM $trTable";
    List allData = await database.rawQuery(query);
    List<TransactionModal> allTransactions =
        allData.map((e) => TransactionModal.fromMap(data: e)).toList();

    return allTransactions;
  }
}
