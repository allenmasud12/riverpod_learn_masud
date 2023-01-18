import 'package:flutter/material.dart';
import 'package:riverpod_learn_masud/features/00_home/models/sub_screen_model.dart';
import 'package:riverpod_learn_masud/features/01_provider/views/provider_screen.dart';
import 'package:riverpod_learn_masud/features/02_state_providers/views/state_provider_screen.dart';
import 'package:riverpod_learn_masud/features/03_change_notifier_dcounter/views/counter_screen.dart';
import 'package:riverpod_learn_masud/features/04_state_notifier_provider_dtodo/views/todo_screen.dart';
import 'package:riverpod_learn_masud/features/05_stream_provider_dtimer/views/stream_provider_screen.dart';
import 'package:riverpod_learn_masud/features/06_future_provider_dhttp/views/future_provider_screen.dart';
import 'package:riverpod_learn_masud/widgets/m_scaffold.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key,}) : super(key: key);

  // (Future) refactor will change this with route generator;
  final List<SubScreen> screens = [
    SubScreen("Provider", (name) => ProviderScreen(name)),
    SubScreen("State Provider", (name) => StateProviderScreen(name)),
    SubScreen("Change Notifier (Counter)", (name) =>  CounterScreen(name)),
    SubScreen("Sate Notifier Provider (Todo)", (name) =>  TodoScreen(name)),
    SubScreen("StreamProvider (Counter)", (name) =>  StreamProviderScreen(name)),
    SubScreen("FutureProvider (Http)", (name) =>  FutureProviderScree(name)),
  ];

  @override
  Widget build(BuildContext context) {
    return MScaffold(
        body: ListView(
          children: [
            for(int i = 0; i<screens.length; i++)
              Card(child: ListTile(title: Text(screens[i].title), onTap: screens[i].onTap,)),
          ],
      )
    );
  }
}
