import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yeedart/yeedart.dart';
import 'package:yeelight/blocs/blocs.dart';
class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {

  @override
  Stream<DiscoverState> mapEventToState(DiscoverEvent event) async* {
    if (event is FetchLights) {
      try {
        final List<DiscoveryResponse> resp = await refreshLights();
        print(resp);
        yield DiscoverLoaded(discoveryResponse: resp);
      } catch(_) {
        print(_);
        yield DiscoverError();
      }
    }
  }

  @override
  DiscoverState get initialState => DiscoverEmpty();

  Future<List<DiscoveryResponse>> refreshLights() async {
    Duration timeout = const Duration(milliseconds: 2000); // average timeout to discover all lights 
    final toto = await Yeelight.discover(timeout: timeout);
    print(toto);
    return toto;
  }
}