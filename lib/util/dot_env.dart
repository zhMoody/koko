import "package:flutter/material.dart";
import "package:flutter/services.dart" show rootBundle;

class NotInitialized extends Error {}

class FileNotFound extends Error {}

class EmptyEnvFile extends Error {}

class Parser {
  Map<String, String> parse(Iterable<String> lines) {
    var ret = <String, String>{};
    for (var line in lines) {
      var kv = parseOne(line, env: ret);
      if (kv.isEmpty) continue;
      ret.putIfAbsent(kv.keys.single, () => kv.values.single);
    }
    return ret;
  }

  Map<String, String> parseOne(String line,
      {Map<String, String> env = const {}}) {
    if (line.isNotEmpty && line.contains("=")) {
      final lhsAndRhs = line.split("=");
      final lhs = lhsAndRhs.first.trim();
      final rhs = lhsAndRhs.last.trim();
      return {lhs: rhs};
    }
    return {};
  }
}

class Config {
  bool _isInit = false;
  final Map<String, String> _envMap = {};

  Map<String, String> get env {
    if (!_isInit) {
      throw NotInitialized();
    }
    return _envMap;
  }

  bool get isInit => _isInit;

  void clear() => _envMap.clear();

  Parser parser = Parser();

  Future<void> from({
    String path = "assets/.env",
  }) async {
    clear();
    final lines = await _getEntriesFrom(path);
    final entries = parser.parse(lines);
    _envMap.addAll(entries);
    _isInit = true;
  }

  Future<List<String>> _getEntriesFrom(String path) async {
    try {
      // WidgetsFlutterBinding.ensureInitialized();
      final envStr = await rootBundle.loadString(path);
      if (envStr.isEmpty) {
        throw EmptyEnvFile();
      }
      return envStr.split("\n");
    } on FlutterError {
      throw FileNotFound();
    }
  }

  String? get(String name) {
    return env[name];
  }
}

Config dotEnv = Config();
Config apis = Config();
