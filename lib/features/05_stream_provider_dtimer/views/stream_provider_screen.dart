import 'package:flutter/material.dart';
import 'package:riverpod_learn_masud/features/05_stream_provider_dtimer/states/m_stream_provider.dart';
import 'package:riverpod_learn_masud/widgets/m_scaffold.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StreamProviderScreen extends ConsumerWidget {
  final String title;
  const StreamProviderScreen(this.title, {Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<int> loading = ref.watch(loadingProvider);
    return MScaffold(
        title: title,
        body: loading.when(
            data: (percent) => Text('Loading $percent'),
            loading:()=> CircularProgressIndicator(),
            error: (err,stack) => Text('error $err'))
    );
  }

}
