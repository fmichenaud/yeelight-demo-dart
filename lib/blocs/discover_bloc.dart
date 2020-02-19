import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yeedart/yeedart.dart';
import 'package:yeelight/enums/discover_event.dart';

class DiscoverBloc extends Bloc<DiscoverEvent, List<DiscoveryResponse>> {

  @override
  Stream<List<DiscoveryResponse>> mapEventToState(DiscoverEvent event) async* {
    refreshLights();
    yield state;
  }

  @override
  List<DiscoveryResponse> get initialState => [];

  Future<List<DiscoveryResponse>> refreshLights() async {
    print("toto");
    final toto = await Yeelight.discover();
    return toto;
  }
}