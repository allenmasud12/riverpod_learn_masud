import 'package:flutter/material.dart';
import 'package:riverpod_learn_masud/features/01_provider/states/m_provider_state.dart';
import 'package:riverpod_learn_masud/widgets/m_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderScreen extends StatelessWidget {
  final String title;
  const ProviderScreen(this.title, {Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MScaffold(
      title: title,
        body: Center(
          // access the global variables pool
          child: Consumer(builder: (context, ref, _) {
            var globalText = ref.watch(mProvider); // keep an eye on "aNumber"
            return Text("$globalText");
          }),
    ));
  }
}
