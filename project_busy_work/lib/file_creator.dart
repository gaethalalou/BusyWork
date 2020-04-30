// ignore: camel_case_types
import 'dart:io';

class fileCreator {
  File jsonFile;
  Directory dir;
  String fileName = "tasks.json";
  bool fileExists = false;
  Map<String, String> fileContent;
}
