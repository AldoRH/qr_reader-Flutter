import 'package:flutter/material.dart';
import 'package:qr_reader/widgets/widgets.dart';


class DirectionsScreen extends StatelessWidget {
  const DirectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return const ScanTiles(tipo: 'http',);
  }
}