import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yeelight/services/pages.dart';
import 'package:yeelight/screens/app_screen.dart';
import 'package:yeelight/blocs/bottom_navigation/bottom_navigation.dart';
import 'package:yeelight/theme/style.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      home: BlocProvider<BottomNavigationBloc>(
        builder: (context) => BottomNavigationBloc(
          firstPageRepository: FirstPage(),
          secondPageRepository: SecondPage(),
        )
          ..dispatch(AppStarted()),
        child: AppScreen(),
      )
    );
  }
}
