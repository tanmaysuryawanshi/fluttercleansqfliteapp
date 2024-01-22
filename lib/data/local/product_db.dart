import 'package:flutterproductclean/data/local/DatabaseService.dart';
import 'package:sqflite/sqflite.dart';

import '../model/productmodel.dart';

class ProductDb {
  final tableName = 'products';
  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
    "id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "price" TEXT NOT NULL,
    PRIMARY KEY("id" AUTOINCREMENT)
    );""");
  }

  Future<int> create({required String name, required String price}) async {
    final database = await DatabaseService().database;
    return await database
        .rawInsert('''INSERT INTO $tableName (name,price) VALUES (?,?)''', [
      name,
      price,
    ]);
  }

  Future<List<ProductDataModel>> fetchAll() async {
    final database = await DatabaseService().database;
    final products = await database.rawQuery('''SELECT * from $tableName''');
    return products.map((product) => ProductDataModel.fromDb(product)).toList();
  }
}
