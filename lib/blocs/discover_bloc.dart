import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yeedart/yeedart.dart';
import 'package:yeelight/blocs/blocs.dart';
class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {

  @override
  Stream<DiscoverState> mapEventToState(DiscoverEvent event) async* {
    if (event is FetchLights) {
      try {
        print('try');
        final List<DiscoveryResponse> resp = await refreshLights();
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
    print('toto');
    final toto = await Yeelight.discover();
    print(toto);
    return toto;
  }
}