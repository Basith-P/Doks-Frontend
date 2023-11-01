import 'package:doks/features/realtime_collab/socket_client.dart';
import 'package:socket_io_client/socket_io_client.dart';

class SocketRepository {
  final _socketClient = SocketClient.instance.socket!;

  Socket get socket => _socketClient;

  void joinRoom(String id) {
    _socketClient.emit('joinRoom', id);
  }
}
