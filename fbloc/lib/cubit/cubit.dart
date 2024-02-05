import 'package:fbloc/bloc/counter_bloc.dart';
import 'package:fbloc/cubit/counter_cubit.dart';
import 'package:fbloc/cubit/inc_dec_buttton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageCubit extends StatelessWidget {
  PageCubit({super.key, required this.title});

  final String title;

  final CounterCubit2 counterCubit = CounterCubit2();

  @override
  Widget build(BuildContext context) {
    final counterCubit = BlocProvider.of<CounterCubit2>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterBloc, int>(
                bloc: counterBloc,
                builder: (context, state) {
                  return Text(
                    '$state',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: IncDecButton());
  }
}
