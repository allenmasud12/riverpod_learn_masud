import 'package:flutter_riverpod/flutter_riverpod.dart';
class Repository{
  Future<int> getUserCount() async{
    await Future.delayed(Duration(seconds: 1));
    return 17;
  }
}

// 1
final userCountProvider = FutureProvider<int>((ref) async {
  return Repository().getUserCount();
});
