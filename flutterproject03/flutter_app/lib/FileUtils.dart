import 'dart:io';
import 'package:http/http.dart' as http;

class FileUtils {
  static Future<bool> exists(String dir, String name) async {
    var file = File('$dir/$name');
    return (await file.exists());
  }

  static Future<File> downloadFile(String url, String filename, String dir) async {
    var req = await http.Client().get(Uri.parse(url));
    var file = File('$dir/$filename');
    return file.writeAsBytes(req.bodyBytes);
  }
}