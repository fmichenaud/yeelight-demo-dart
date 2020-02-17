import 'package:flutter/material.dart';
import 'package:yeelight/theme/style.dart';
import 'package:yeelight/routes.dart';
import 'package:yeelight/bloc/bloc-prov-tree.dart';
import 'package:yeelight/bloc/bloc-prov.dart';
import 'package:yeelight/blocs/blocs.dart';
import 'blocs/blocs.dart';

void main() {
  runApp(ExampleApp());
}
class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProviderTree(
      blocProviders: <BlocProvider>[
        BlocProvider<AuthBloc>(bloc: AuthBloc()),
        BlocProvider<PrefBloc>(bloc: PrefBloc()),
      ],
      child: MaterialApp(
        title: 'ExampleApp',
        theme: appTheme(),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}