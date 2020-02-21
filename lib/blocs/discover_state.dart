import 'package:meta/meta.dart';
import 'package:yeedart/yeedart.dart';

abstract class DiscoverState {
  const DiscoverState();

  List<Object> get props => [];
}

class DiscoverEmpty extends DiscoverState {}

class DiscoverLoading extends DiscoverState {}

class DiscoverLoaded extends DiscoverState {
  final List<DiscoveryResponse> discoveryResponse;

  const DiscoverLoaded({@required this.discoveryResponse}) : assert(discoveryResponse.length > 0);

  @override
  List<Object> get props => [discoveryResponse];
}

class DiscoverError extends DiscoverState {}
