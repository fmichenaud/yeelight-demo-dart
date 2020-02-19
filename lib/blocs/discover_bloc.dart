import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yeedart/yeedart.dart';
import 'package:yeelight/enums/discover_event.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, List<DiscoveryResponse>> {

  @override
  Stream<List<DiscoveryResponse>> mapEventToState(DiscoverEvent event) async* {
    final post = await refreshLights();
    yield post;
  }

  @override
  List<DiscoveryResponse> get initialState => [];

  Future<List<DiscoveryResponse>> refreshLights() async {
    Duration timeout = const Duration(milliseconds: 200); // average timeout to discover all lights 
    final toto = await Yeelight.discover(timeout: timeout);
    print(toto);
    return toto;
  }
}