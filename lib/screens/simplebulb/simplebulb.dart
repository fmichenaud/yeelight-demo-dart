
import 'package:flutter/cupertino.dart';
import 'package:yeedart/yeedart.dart';

class SimpleBulb extends StatelessWidget {
  final DiscoveryResponse bulb;

  SimpleBulb({
    Key key,
    @required this.bulb
  }) : assert(bulb != null),
      super(key: key);

  @override
  Widget build(BuildContext context){
    return Text(bulb.id.toString());
  }

}