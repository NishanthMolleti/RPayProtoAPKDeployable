import 'dart:io' show Platform;

var host;
dynamic returnHost() {
  if (Platform.isAndroid) {
    host = "10.0.2.2";
    return host;
  } else {
    host = "localhost";
    return host;
  }
}
