import 'dart:async';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:yeelight/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:yeelight/bloc/bloc.dart';

class HomepageBloc extends Bloc {
  StreamSubscription _audioPlayerStateSubscription;

  Stream<String> get example => _exampleSubject.stream;
  Sink<String> get exampleSink => _exampleSubject.sink;
  final StreamController<String> _exampleSubject = StreamController<String>();

  HomepageBloc();

  void dispose() {
    _exampleSubject.close();  
  }
}
