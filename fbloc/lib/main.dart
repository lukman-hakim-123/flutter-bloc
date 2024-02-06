import 'package:fbloc/bloc.dart';
import 'package:fbloc/bloc/counter_bloc.dart';
import 'package:fbloc/cubit/counter_cubit.dart';
import 'package:fbloc/cubit/cubit.dart';
import 'package:fbloc/login/bloc/auth_bloc.dart';
import 'package:fbloc/login/pages/login_page.dart';
import 'package:fbloc/login/pages/my_bloc_observer.dart';
import 'package:fbloc/provider.dart';
import 'package:fbloc/stateful.dart';
import 'package:fbloc/todolist/cubit/todo_cubit.dart';
import 'package:fbloc/todolist/pages/todo_page.dart';
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
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        // create: (context) => TodoCubit(),
        create: (context) => AuthBloc(),
        child: MaterialApp(
            title: 'Bloc Login Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const LoginPage())

        // MultiBlocProvider(
        //   providers: [
        //     BlocProvider(create: (_) => CounterBloc()),
        //     BlocProvider(create: (_) => CounterCubit2()),
        //   ],
        //   child: PageCubit(
        //     title: 'Flutter Demo',
        //   ),
        // )

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
