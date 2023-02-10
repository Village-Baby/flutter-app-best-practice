import 'package:best_practice/feature/home/home_ui_actions.dart';
import 'package:best_practice/feature/home/home_use_cases.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends StatefulHookConsumerWidget {
  static const routeName = '/home';

  static pushNamed(BuildContext context) {}

  static pushAndReplaceName(BuildContext context) {}

  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends ConsumerState<HomePage> with HomeUiActions {
  @override
  void initState() {
    read.init(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          '$watch',
          style: TextStyle(color: Colors.grey.shade900, fontSize: 24),
        ),
        const SizedBox(height: 16),
        Row(children: [
          const SizedBox(width: 16),
          Expanded(
            child: CountButton(
              onPressed: () {
                read.increase();
              },
              title: '증가',
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: CountButton(
              onPressed: () {
                read.decrease();
              },
              title: '감소',
            ),
          ),
          const SizedBox(width: 16),
        ])
      ]),
    );
  }

  @override
  goSettings() {}

  @override
  HomeUseCases get read => ref.read(homeUseCases.notifier);

  @override
  get watch => ref.watch(homeUseCases);
}

class CountButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const CountButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      height: 48,
      minWidth: double.infinity,
      color: Colors.blue,
      child: Text(title),
    );
  }
}
