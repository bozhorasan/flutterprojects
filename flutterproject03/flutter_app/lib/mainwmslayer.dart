import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'zoombuttons_plugin_option.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Map App',
    home: Scaffold(appBar: new AppBar(title: new Text('Leaflet Flutter Demo HVL 1m tiles + Zoom Buttons'),),body: Stack(children: <Widget>[
      new FlutterMap(
        options: MapOptions(
          center: LatLng(
            41.96 ,//41.1051
            33.88,//29.0629
          ),
          minZoom: 2.0,
          maxZoom: 12.0,
          zoom: 7.0,//8.0
          swPanBoundary: LatLng(32.0,5.0),
          nePanBoundary: LatLng(49.0,69.0),
          plugins: [
            ZoomButtonsPlugin(),
          ],
        ),
        layers: [
          TileLayerOptions(
              wmsOptions: WMSTileLayerOptions(
//                    baseUrl: 'http://maps.heigit.org/osm-wms/service?',
                baseUrl: 'http://192.168.1.101:8080/geoserver/bso/wms?',
//                        layers: ['europe_wms:hs_srtm_europa'],
                layers: ['bso:1m_geotiff'],
              )),
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
