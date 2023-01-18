import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = ChangeNotifierProvider<Counter>((ref) => new Counter());

class Counter extends ChangeNotifier {
  int count;
  // 1
  Counter([this.count = 0]);

  // 2
  void increment() {
    count++;
    notifyListeners();
  }
}

/// DOWNLOAD COUNT CAN BE INCREASE WITHOUT INCREMENT MethodCall
/// which will not re render ui
///  context.read(counterProvider).count = count + 1;