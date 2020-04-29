import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'FileUtils.dart';
import 'mapConstants.dart';

void main() {
  runApp(
    new MaterialApp(
      title: 'Download File Example',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new FlutterDemo(),
    ),
  );
}

class FlutterDemo extends StatefulWidget {
  FlutterDemo({Key key}) : super(key: key);

  @override
  _FlutterDemoState createState() => new _FlutterDemoState();
}

class _FlutterDemoState extends State<FlutterDemo> {
  int _counter;

  @override
  void initState() {
    super.initState();
    _lengthOfDownloadedFile().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _getLocalFile() async {
    // get the path to the document directory.
    String dir = (await getApplicationDocumentsDirectory()).path;
    String fileName = MapConstants.file01;
    return new File('$dir/$fileName');
  }

  Future<int> _lengthOfDownloadedFile() async {
    try {
      var length;
      File file = await _getLocalFile();
      if (await file.exists()){
        length = file.length();
      }else {
        length = -1;
      }
      return length;
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _downloadFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    var mapFile = await FileUtils.downloadFile(MapConstants.getServerPathOfMapFile(MapConstants.file01),MapConstants.file01,dir);

    var length =  await (await _getLocalFile()).length();
    setState(() {
      _counter = length;
    });
  }

  Future<Null> _removeFile() async {
    String dir = (await getApplicationDocumentsDirectory()).path;
    var file = await _getLocalFile();
    if (await file.exists()) {
      await file.delete();
      setState(() {
        _counter = -2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Download File Example')),
      body: new Center(
        child: new Text('Length of downloaded file $_counter'),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _downloadFile,
        tooltip: 'Download',
        child: new Icon(Icons.file_download),
      ),
      persistentFooterButtons: <Widget>[
        IconButton (icon: Icon(Icons.delete), onPressed: _removeFile,)
      ],
    );
  }
}

