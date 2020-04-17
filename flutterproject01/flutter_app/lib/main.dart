import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Map App',
  home: Scaffold(appBar: new AppBar(title: new Text('Leaflet Flutter Demo HVL'),),body: Stack(children: <Widget>[
    new FlutterMap(options: new MapOptions(
        zoom: 7,
        minZoom: 1.0,
        center:  new LatLng(39.92, 32.85)),
        layers: [
          new TileLayerOptions(
              urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',subdomains: ['a','b','c']),
              new MarkerLayerOptions(markers: [
                new Marker(width: 90.0,height: 90.0,point: new LatLng(39.92, 32.85),builder: (context)=>new Container(
      child: IconButton(icon: Icon(Icons.flag), onPressed: () {print('Marker tapped!');}),
//        40.71,-74.00 40.73, -74.00
                )),
                new Marker(width: 90.0,height: 90.0,point: new LatLng(39.82, 31.75),builder: (context)=>new Container(
                  child: IconButton(icon: Icon(Icons.airplanemode_active), onPressed: () {print('Marker tapped!');}),
                )),
                new Marker(width: 90.0,height: 90.0,point: new LatLng(38.82, 31.4),builder: (context)=>new Container(
                  child: IconButton(icon: Icon(Icons.airplanemode_inactive), onPressed: () {print('Marker tapped!');}),
                ))
              ])
        ]

    )
  ],),),
));
