import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/providers.dart';
import 'package:qr_reader/screens/screens.dart';
import 'package:qr_reader/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial'),
        actions: [
          IconButton(
            onPressed: (){
              Provider.of<ScanListProvider>(context, listen: false).borrarTodos();
            },
             icon: const Icon(Icons.delete_forever)
             )
        ],
      ),
      body: _HomeScreenBody(),
     bottomNavigationBar: const CustomNavigationBar(),
     floatingActionButton: const ScanButton(),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   );
  }
}

class _HomeScreenBody extends StatelessWidget {
  const _HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {

    final uiPorvider = Provider.of<UiProvider>(context);
    final currentIndex = uiPorvider.selectedMenuOpt;


    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    switch(currentIndex){

      case 0:
        scanListProvider.cargarScansPorTipo('geo');
        return MapsScreen();
      
      case 1:
        scanListProvider.cargarScansPorTipo('http');
        return DirectionsScreen();


      default: return MapsScreen();
    }
  }
}