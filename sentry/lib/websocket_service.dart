import 'package:web_socket_channel/web_socket_channel.dart';

final channel = WebSocketChannel.connect(Uri.parse('ws://192.168.1.8:9001/ws')); // Change IP to match C++ server

void listenForScans() {
  channel.stream.listen((message) {
    print("RFID Scanned: $message");
    showNotification("New RFID Scan", message);
  });
}

void showNotification(String title, String body) {
  print("$title: $body"); // Replace with Flutter local notification package
}
