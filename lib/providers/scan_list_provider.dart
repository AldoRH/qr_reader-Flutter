
import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:qr_reader/providers/providers.dart';

class ScanListProvider extends ChangeNotifier{

  List<ScanModel> scans = [];
  String tipoSeleccionado = "http";

  Future<ScanModel> nuevoScan(String valor) async{
      final nuevoScan = ScanModel(valor: valor);
      final id = await DBProvider.db.nuecoScan(nuevoScan);

      //Asignar el ID de la base de datos
      nuevoScan.id = id;

      if (tipoSeleccionado == nuevoScan.tipo){
        scans.add(nuevoScan);
        notifyListeners();
      }
      return nuevoScan;
  }

  cargarScans() async{
    final scans = await DBProvider.db.getAllScan();
    this.scans = [...?scans];
    notifyListeners();
  }

  cargarScansPorTipo(String tipo) async{
    final scans = await DBProvider.db.getScanByType(tipo);
    this.scans = [...?scans];
    tipoSeleccionado = tipo;
    notifyListeners();

  }

  borrarTodos()async{
    await DBProvider.db.deleteAll();
    scans = [];
    notifyListeners();

  }

  borrarScanPorId (int id)async{
    await DBProvider.db.deleteScanById(id);
  }



}