import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:yeelight/blocs/bottom_navigation/bottom_navigation.dart';
import 'package:yeelight/screens/pages.dart';

class AppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BottomNavigationBloc bottomNavigationBloc = BlocProvider.of<BottomNavigationBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff121212),
        title: Text('Yeelight Demo'),
        textTheme: TextTheme(title: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0)),
        centerTitle: true,
      ),
      body: BlocBuilder<BottomNavigationEvent, BottomNavigationState>(
        bloc: bottomNavigationBloc,
        builder: (BuildContext context, BottomNavigationState state) {
          if (state is PageLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is FirstPageLoaded) {
            return HomePage(text: state.text);
          }
          if (state is SecondPageLoaded) {
            return SecondPage(number: state.number);
          }
          return Container();
        },
      ),
      bottomNavigationBar: BlocBuilder<BottomNavigationEvent, BottomNavigationState>(
          bloc: bottomNavigationBloc,
          builder: (BuildContext context, BottomNavigationState state) {
            return BottomNavigationBar(
              currentIndex: bottomNavigationBloc.currentIndex,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, color: Colors.white),
                  title: Text('First'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.all_inclusive, color: Colors.white),
                  title: Text('Second'),
                  
                ),
              ],
              onTap: (index) => bottomNavigationBloc.dispatch(PageTapped(index: index)),
            );
          }
      ),
    );
  }
}
