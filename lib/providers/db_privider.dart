import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider{
  // Database _database;
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();


  Future <Database?> get database async{

    if(_database != null) return _database;

    _database = await initDB();

    return _database;

  }

  Future <Database?> initDB() async{

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path ,'ScansDB.db');

    print(path);


    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version ) async{
        await db.execute('''
          CREATE TABLE Scans(
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT
          )

       ''');

      }
    );
  }


  Future<int?> nuevoScanRaw(ScanModel nuevoScan)async{
    final id = nuevoScan.id;
    final tipo = nuevoScan.tipo;
    final valor = nuevoScan.valor;

    final db = await database;

    final res = await db?.rawInsert(''' 
      INSERT INTO Scans(id, tipo,valor)
        VALUES($id,$tipo, $valor)
    ''');

    return res;
  }

  Future<int?> nuecoScan (ScanModel nuevoScan)async{
    final db = await database;
    final res = await db?.insert('Scans', nuevoScan.toJson());
    return res;
  }

  Future<ScanModel?> getScanById (int id)async{
    final db = await database;
    final res = await db?.query('Scans', where: 'id = ?', whereArgs: [id]);
    return res!.isNotEmpty
            ? ScanModel.fromJson(res.first)
            :null;
  }

  Future<List<ScanModel>?> getAllScan ()async{
    final db = await database;
    final res = await db?.query('Scans');
    return res!.isNotEmpty
            ? res.map((e) => ScanModel.fromJson(e)).toList()
            :null;
  }

  Future<List<ScanModel>?> getScanByType (String tipo)async{
    final db = await database;
    final res = await db?.query('Scans',where: 'tipo = ?', whereArgs: [tipo]);
    return res!.isNotEmpty
            ? res.map((e) => ScanModel.fromJson(e)).toList()
            :null;
  }

  Future<int?> updateScan (ScanModel nuevoScan)async{
    final db = await database;
    final res = await db?.update('Scans', nuevoScan.toJson(), where: 'id = ?', whereArgs: [nuevoScan.id]);
    return res;
  }
  Future<int?> deleteScanById ( int id ) async {

    final db  = await database;
    final res = await db?.delete('Scans', where: 'id = ?', whereArgs: [id]);
    return res;
  }


  Future<int?> deleteAll() async {

    final db  = await database;
    final res = await db?.rawDelete('DELETE FROM Scans');
    return res;
  }

}