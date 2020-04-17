import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'zoombuttons_plugin_option.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Map App',
    home: Scaffold(appBar: new AppBar(title: new Text('Leaflet Flutter Demo HVL 1m2 offline tiles + Zoom Buttons'),),body: Stack(children: <Widget>[
      new FlutterMap(
        options: MapOptions(
          center: LatLng(
            38.85,
            33.44,
          ),
          minZoom: 5.0,
          maxZoom: 12.0,
          zoom: 5.0,//
          swPanBoundary: LatLng(35.5,25.0),
          nePanBoundary: LatLng(42.5,42.0),
          plugins: [
            ZoomButtonsPlugin(),
          ],
        ),
        layers: [
          TileLayerOptions(
              tileProvider: MBTilesImageProvider.fromAsset(
                  'assets/h1m2.mbtiles'),
              maxZoom: 13.0,
              backgroundColor: Colors.white,
              tms: true),
          ZoomButtonsPluginOption(
              minZoom: 4,
              maxZoom: 19,
              mini: false,
              padding: 10,
              alignment: Alignment.bottomRight)
        ],
      )
    ],),),
  ));}
