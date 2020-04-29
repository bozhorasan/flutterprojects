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
            33.74,
          ),
          minZoom: 6.0,
          maxZoom: 12.0,
          zoom: 6.0,//
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
              maxZoom: 12.0,
              backgroundColor: Colors.white,
              tms: true),
          ZoomButtonsPluginOption(
              minZoom: 6,
              maxZoom: 12,
              mini: true,
              padding: 10,
              alignment: Alignment.topRight)
        ],
      )
    ],),),
  ));}
