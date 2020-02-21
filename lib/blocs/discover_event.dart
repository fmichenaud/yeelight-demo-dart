import 'package:equatable/equatable.dart';

abstract class DiscoverEvent {
  const DiscoverEvent();
}

class FetchLights extends DiscoverEvent {
  const FetchLights();
}