import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yeedart/yeedart.dart';
import 'package:yeelight/blocs/blocs.dart';
import 'package:yeelight/blocs/discover_bloc.dart';

/* class HomePage extends StatelessWidget {
  final String text;

  HomePage({this.text}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<DiscoverBloc>(
          create: (context) => DiscoverBloc(),
          child: Column(
            children: <Widget>[
              Title(),
              LightBoxContainer(),
              DiscoverButton(),
              DiscoverResults(),
            ],
          )),
    );
  }
} */

class HomePage extends StatefulWidget {
  State<HomePage> createState() => _DiscoverState();
}

class _DiscoverState extends State<HomePage> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Test light')),
        body: Container(child: BlocBuilder<DiscoverBloc, DiscoverState>(
            builder: (context, themeState) {
          return Container(
            child: RefreshIndicator(
                onRefresh: () {
                  BlocProvider.of<DiscoverBloc>(context).add(
                    FetchLights(),
                  );
                  return _refreshCompleter.future;
                },
                child: Container(
                  child: Center(
                    child: BlocConsumer<DiscoverBloc, DiscoverState>(
                        listener: (context, state) {
                      if (state is DiscoverLoaded || state is DiscoverError) {
                        _refreshCompleter?.complete();
                        _refreshCompleter = Completer();
                      }
                    }, builder: (context, state) {
                      if (state is DiscoverLoading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (state is DiscoverLoaded) {
                        final discoverResponse =
                            state.discoveryResponse.first.id.toString();
                        print(discoverResponse);
                        return ListView(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 100.0),
                              child: Center(
                                child: Text(discoverResponse),
                              ),
                            ),
                          ],
                        );
                      }
                      if (state is DiscoverError) {
                        return Text('Error ! Pull To Refresh');
                      }
                      return Container(
                        child: Text('Empty List ! Pull To Refresh'),
                      );
                    }),
                  )
                )),
          );
        })));
  }
}
