import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//1
class LoadingProcessor{
  LoadingProcessor(){
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(controller.isClosed){
        timer.cancel();
      }else{
        controller.sink.add(loading);
        loading += 10;
      }
    });
  }

  final controller = StreamController<int>();
  var loading = 0;
  Stream<int> get stream => controller.stream;

  void dispose() {
    controller.close();
  }
}

final loadingProvider = StreamProvider.autoDispose<int>((ref) async* {
  final loadingProcessor = LoadingProcessor();
  // 2
  ref.onDispose(() => loadingProcessor.controller.sink.close());
  // 3
  await for (final value in loadingProcessor.stream) {
    if (value == 100) {
      loadingProcessor.controller.sink.close();
    }
    // 4
    yield value;
  }
});
