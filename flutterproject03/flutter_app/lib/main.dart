import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Map App',
  home: Scaffold(appBar: new AppBar(title: new Text('Leaflet Flutter Demo HVL Berlin tiles'),),body: Stack(children: <Widget>[
    new FlutterMap(
      options: MapOptions(
        center: LatLng(
          52.516144,
          13.404938,
        ),
        minZoom: 12.0,
        maxZoom: 14.0,
        zoom: 12.0,
        swPanBoundary: LatLng(52.492205, 13.282081),
        nePanBoundary: LatLng(52.540084, 13.527795),
      ),
      layers: [
        TileLayerOptions(
            tileProvider: MBTilesImageProvider.fromAsset(
                'assets/berlin.mbtiles'),
            maxZoom: 14.0,
            backgroundColor: Colors.white,
            tms: true),
      ],
    )
  ],),),
));}
