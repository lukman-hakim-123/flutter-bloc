import 'package:fbloc/bloc.dart';
import 'package:fbloc/bloc/counter_bloc.dart';
import 'package:fbloc/cubit/counter_cubit.dart';
import 'package:fbloc/cubit/cubit.dart';
import 'package:fbloc/provider.dart';
import 'package:fbloc/stateful.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// void main() {
//   runApp(
//     BlocProvider(
//       create: (context) => CounterCubit(),
//       child: const MyApp(),
//     ),
//   );
// }
// void main() {
//   runApp(MultiProvider(providers: [
//     ChangeNotifierProvider(create: (_) => Counter()),
//   ], child: const MyApp()));
// }
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => CounterBloc()),
            BlocProvider(create: (_) => CounterCubit2()),
          ],
          child: PageCubit(
            title: 'Flutter Demo',
          ),
        )
        // BlocProvider(
        //   create: (context) => CounterBloc(),
        //   child: BlocProvider(
        //     create: (context) => CounterCubit2(),
        //     child: PageCubit(
        //       title: 'Flutter Demo',
        //     ),
        //   ),
        // ),
        );
  }
}
