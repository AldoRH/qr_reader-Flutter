import 'package:flutter/material.dart';
import 'package:qr_reader/widgets/widgets.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return const ScanTiles(tipo: 'geo',);
  }
}