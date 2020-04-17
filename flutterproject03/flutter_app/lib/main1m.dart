import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Map App',
    home: Scaffold(appBar: new AppBar(title: new Text('Leaflet Flutter Demo HVL 1m tiles'),),body: Stack(children: <Widget>[
      new FlutterMap(
        options: MapOptions(
          center: LatLng(
            41.1051,
            29.0629,
          ),
          minZoom: 8.0,
          maxZoom: 13.0,
          zoom: 3.0,//8.0
          swPanBoundary: LatLng(40.8853,26.6784),
          nePanBoundary: LatLng(41.3282,29.5244),
        ),
        layers: [
          TileLayerOptions(
              tileProvider: MBTilesImageProvider.fromAsset(
                  'assets/h1m.mbtiles'),
              maxZoom: 13.0,
              backgroundColor: Colors.white,
              tms: true),
        ],
      )
    ],),),
  ));}
