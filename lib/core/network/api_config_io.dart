// import 'dart:io';
import 'dart:io' show Platform;

<<<<<<< HEAD
String getApiBaseUrl() {
  const port = String.fromEnvironment('API_PORT', defaultValue: '3001');
=======

String getApiBaseUrl() {
  const port = String.fromEnvironment('API_PORT', defaultValue: '3000');
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
  if (Platform.isAndroid) return 'http://10.0.2.2:$port/api';
  return 'http://localhost:$port/api';
}

String getPublicBaseUrl() {
<<<<<<< HEAD
  const port = String.fromEnvironment('API_PORT', defaultValue: '3001');
  if (Platform.isAndroid) return 'http://10.0.2.2:$port';
  return 'http://localhost:$port';
}
=======
  const port = String.fromEnvironment('API_PORT', defaultValue: '3000');
  if (Platform.isAndroid) return 'http://10.0.2.2:$port';
  return 'http://localhost:$port';
}
>>>>>>> e81054ccdfbd484d6376c45e8616999d3b5ab4a2
