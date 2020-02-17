import 'package:flutter/material.dart';
import 'package:yeelight/screens/homepage/components/body.dart';
import 'package:yeelight/screens/homepage/homepage-bloc.dart';
import 'package:yeelight/bloc/bloc-prov.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  HomepageBloc exampleBloc;

  @override
  void initState() {
    super.initState();

    exampleBloc = HomepageBloc();
  }

  @override
  void dispose() {
    exampleBloc.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: exampleBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("First Screen"),
        ),
        body: Body(),
      ),
    );
  }
}
