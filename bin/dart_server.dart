import 'dart:io';

const String serverName = 'dartserve';
const int port = 8080;

Future<void> main() async {
  final server = await HttpServer.bind(InternetAddress.loopbackIPv4, port);
  print('Listening on ${server.address} port ${server.port}');

  await for (HttpRequest request in server) {
    request.response
      ..headers.contentType = ContentType.html
      ..write('Hello, world!')
      ..close();
  }
}
