/*
File jsonFile;
  Directory dir;
  String fileName;
  bool fileExists;
  Map<String, String> fileContent;

  @override
  void initState() {
    super.initState();
    getApplicationDocumentsDirectory().then((Directory directory) {
      dir = directory;
      jsonFile = new File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();
      if (fileExists) {
        this.setState(
            () => fileContent = json.decode(jsonFile.readAsStringSync()));
      }
    });
  }

*/
