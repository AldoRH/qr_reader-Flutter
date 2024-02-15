import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {

    final uiPorvider = Provider.of<UiProvider>(context);
    final currentIndex = uiPorvider.selectedMenuOpt;


    return BottomNavigationBar(
      onTap: (int i) => uiPorvider.selectedMenuOpt= i,
      currentIndex: currentIndex,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapa'
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: 'Direcciones'
          ),
      ],
    );
  }
}