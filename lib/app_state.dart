import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userReinforcement =
          prefs.getString('ff_userReinforcement') ?? _userReinforcement;
    });
    _safeInit(() {
      _gptOpener = prefs.getString('ff_gptOpener') ?? _gptOpener;
    });
    _safeInit(() {
      _model = prefs.getString('ff_model') ?? _model;
    });
    _safeInit(() {
      _chunksize = prefs.getInt('ff_chunksize') ?? _chunksize;
    });
    _safeInit(() {
      _chunkoverwrap = prefs.getInt('ff_chunkoverwrap') ?? _chunkoverwrap;
    });
    _safeInit(() {
      _temperature = prefs.getDouble('ff_temperature') ?? _temperature;
    });
    _safeInit(() {
      _var1 = prefs.getString('ff_var1') ?? _var1;
    });
    _safeInit(() {
      _var2 = prefs.getString('ff_var2') ?? _var2;
    });
    _safeInit(() {
      _pineconeNamespace =
          prefs.getString('ff_pineconeNamespace') ?? _pineconeNamespace;
    });
    _safeInit(() {
      _system = prefs.getString('ff_system') ?? _system;
    });
    _safeInit(() {
      _maxtoken = prefs.getInt('ff_maxtoken') ?? _maxtoken;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _userReinforcement = '한국어로 대답하라.';
  String get userReinforcement => _userReinforcement;
  set userReinforcement(String _value) {
    _userReinforcement = _value;
    prefs.setString('ff_userReinforcement', _value);
  }

  String _gptOpener = '자료에 대해서 물어보세요.';
  String get gptOpener => _gptOpener;
  set gptOpener(String _value) {
    _gptOpener = _value;
    prefs.setString('ff_gptOpener', _value);
  }

  bool _awaitingReply = false;
  bool get awaitingReply => _awaitingReply;
  set awaitingReply(bool _value) {
    _awaitingReply = _value;
  }

  String _prompt = '자료를 요약하라.';
  String get prompt => _prompt;
  set prompt(String _value) {
    _prompt = _value;
  }

  String _model = 'gpt-4';
  String get model => _model;
  set model(String _value) {
    _model = _value;
    prefs.setString('ff_model', _value);
  }

  int _chunksize = 1000;
  int get chunksize => _chunksize;
  set chunksize(int _value) {
    _chunksize = _value;
    prefs.setInt('ff_chunksize', _value);
  }

  int _chunkoverwrap = 200;
  int get chunkoverwrap => _chunkoverwrap;
  set chunkoverwrap(int _value) {
    _chunkoverwrap = _value;
    prefs.setInt('ff_chunkoverwrap', _value);
  }

  double _temperature = 0;
  double get temperature => _temperature;
  set temperature(double _value) {
    _temperature = _value;
    prefs.setDouble('ff_temperature', _value);
  }

  String _var1 =
      '<!DOCTYPE html>\n<html>\n<head>\n    <title>File Upload</title>\n    <!-- charset 메타 태그 -->\n    <meta charset=\"UTF-8\">\n    <!-- viewport 메타 태그 -->\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n    <script>\n        async function handleFileUpload() {\n            const input = document.getElementById(\'fileInput\');\n            if (input.files.length == 0) {\n                console.log(\'No file selected\');\n                return;\n            }\n\n            // use FormData to upload files\n            let formData = new FormData();\n            formData.append(\"files\", input.files[0]);\n            formData.append(\"openAIApiKey\", \"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\");\n            formData.append(\"modelName\", \"gpt-4\");\n            formData.append(\"temperature\", 0);\n            formData.append(\"question\", \"자료의 내용을 요약하라\");\n            formData.append(\"basePath\", \"c:/';
  String get var1 => _var1;
  set var1(String _value) {
    _var1 = _value;
    prefs.setString('ff_var1', _value);
  }

  String _var2 =
      '\");\n\n            const targetUrl = \"https://flowiseai-railway-production-0155.up.railway.app/api/v1/prediction/c90ee624-1a7d-43ea-b08f-aa1bca39063d\";\n            const response = await fetch(\n                targetUrl,\n                {\nheaders: { Authorization: \"Bearer 2l5/nZ6EfgSbBnHIkZqC1b2OF4WhsKVVNWbCx10tZmM=\" },\n\n                    method: \"POST\",\n                    body: formData\n                }\n            );\n            const text = await response.text();\n            try {\n                const result = JSON.parse(text);\n                document.getElementById(\'response\').innerText = JSON.stringify(result, null, 2);\n            } catch (error) {\n                console.error(\'Invalid JSON:\', text);\n                throw error;\n            }\n        }\n    </script>\n</head>\n<body>\n    <label for=\"fileInput\">Select a file:</label>\n    <input type=\"file\" id=\"fileInput\">\n    <button onclick=\"handleFileUpload()\">Upload</button>\n    <!-- 응답을 출력할 요소 추가 -->\n    <pre id=\"response\"></pre>\n</body>\n</html>';
  String get var2 => _var2;
  set var2(String _value) {
    _var2 = _value;
    prefs.setString('ff_var2', _value);
  }

  String _pineconeNamespace = 'test';
  String get pineconeNamespace => _pineconeNamespace;
  set pineconeNamespace(String _value) {
    _pineconeNamespace = _value;
    prefs.setString('ff_pineconeNamespace', _value);
  }

  String _system = '한국어로 대답하라.';
  String get system => _system;
  set system(String _value) {
    _system = _value;
    prefs.setString('ff_system', _value);
  }

  int _maxtoken = 3000;
  int get maxtoken => _maxtoken;
  set maxtoken(int _value) {
    _maxtoken = _value;
    prefs.setInt('ff_maxtoken', _value);
  }

  dynamic _fffff;
  dynamic get fffff => _fffff;
  set fffff(dynamic _value) {
    _fffff = _value;
  }

  String _emailDropdown = 'admin@hoca.dev';
  String get emailDropdown => _emailDropdown;
  set emailDropdown(String _value) {
    _emailDropdown = _value;
  }

  String _title = '';
  String get title => _title;
  set title(String _value) {
    _title = _value;
  }

  String _message = '';
  String get message => _message;
  set message(String _value) {
    _message = _value;
  }

  String _timeOrder = '최신순';
  String get timeOrder => _timeOrder;
  set timeOrder(String _value) {
    _timeOrder = _value;
  }

  String _userW = '';
  String get userW => _userW;
  set userW(String _value) {
    _userW = _value;
  }

  bool _filterDone = false;
  bool get filterDone => _filterDone;
  set filterDone(bool _value) {
    _filterDone = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
