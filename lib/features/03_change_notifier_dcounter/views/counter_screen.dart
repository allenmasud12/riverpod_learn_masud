import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_learn_masud/features/03_change_notifier_dcounter/states/counter_state.dart';
import 'package:riverpod_learn_masud/widgets/m_scaffold.dart';



class CounterScreen extends ConsumerWidget {
  final String title;
  const CounterScreen(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider).count;
    return MScaffold(
      title: title,
      body: Column(
        children: [
          Text(count.toString()),
          TextButton(
            // 3
            onPressed: () {
              ref.read(counterProvider).increment();
            },
            child: Text('+'),
          )
        ],
      ),
    );
  }

}
