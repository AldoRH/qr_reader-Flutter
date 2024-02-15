import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {


  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  MapType maptype = MapType.normal;

  @override
  Widget build(BuildContext context) {
    
    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition puntoInicial = CameraPosition(
      target: scan.getLating(),
      zoom: 17,
    );

    //Markers
    Set<Marker> markers = <Marker>{};
    markers.add(Marker(
      markerId: MarkerId('geo-location'),
      position: scan.getLating()
      )
    );

    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        actions: [
          IconButton(
            onPressed: () async{
              final GoogleMapController controller = await _controller.future;
              await controller.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(target: scan.getLating(), zoom: 17)
              ));
            }, 
            icon: const Icon(Icons.location_searching_outlined)
            )
        ],
      ),
      body:  GoogleMap(
        mapType: maptype,
        initialCameraPosition: puntoInicial,
        markers: markers,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(maptype == MapType.normal){
            maptype = MapType.satellite;

          }else{
            maptype = MapType.normal;
          }

          setState(() {
            
          });
        },
        child: const Icon(Icons.layers),
        ),
    );
  }
}