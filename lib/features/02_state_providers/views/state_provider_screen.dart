import 'package:flutter/material.dart';
import 'package:riverpod_learn_masud/features/02_state_providers/states/state_provider.dart';
import 'package:riverpod_learn_masud/widgets/m_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateProviderScreen extends ConsumerWidget {
  final String title;
  const StateProviderScreen(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 3
    final selectedButton = ref.watch(selectedButtonProvider);
    // 4
    // final isRed = watch(isRedProvider);
    final isRed = ref.read(selectedButtonProvider) == 'red';

    return MScaffold(
      title: title,
      body: Column(
        children: [
          Text(selectedButton),
          TextButton(
            // 5
            onPressed: () => ref.read(selectedButtonProvider.notifier).state =  'red',
            child: Text('Red'),
          ),
          TextButton(
            // 5
            onPressed: () => ref.read(selectedButtonProvider.notifier).state = 'blue',
            child: Text('Blue'),
          ),
          // 6
          isRed ? Text('Color is red') : Text('Color is not red')
        ],
      ),
    );
  }

  
}

