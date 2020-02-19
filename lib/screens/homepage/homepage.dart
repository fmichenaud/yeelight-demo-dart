import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yeedart/yeedart.dart';
import 'package:yeelight/blocs/discover_bloc.dart';
import 'package:yeelight/enums/discover_event.dart';
import 'package:yeelight/models/yeelight.dart';

class HomePage extends StatelessWidget {
  final String text;

  HomePage({this.text}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Column(
        children: <Widget>[
          Title(),
          LightBoxContainer(),
          BlocProvider<DiscoverBloc>(
            create: (context) => DiscoverBloc(),
            child: DiscoverButton()),
        
        ],
      )
    );
  }
}

class Title extends StatelessWidget {
  build(context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Row(children: <Widget>[
        Text(
          'Ampoules disponibles',
          style: TextStyle(fontFamily: 'OpenSans', fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
    ]));
  }
}

class LightBlock extends StatefulWidget {
  final YeelightModel yeelight;

  LightBlock(this.yeelight);

  @override
  LightBlockState createState() => new LightBlockState(yeelight);
}

class LightBlockState extends State<LightBlock> {
  YeelightModel yeelight;

  LightBlockState(YeelightModel yeelight) {
    this.yeelight = yeelight;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap: () => print(this.yeelight.name),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(width: 1.0, color: Colors.blueGrey[50]),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Icon(Icons.wb_incandescent, color: Colors.white),
                Text(
                  this.yeelight.name,
                  style: TextStyle(fontFamily: 'OpenSans', fontSize: 14.0),
                ),
              ],)
          )
      ),
    );
  }
}

class LightBoxContainer extends StatelessWidget {
  build(context) {
    List<Widget> listLight = new List<Widget>();
    for (var i = 0; i < 5; i++) {
      YeelightModel light = new YeelightModel(i.toString(), 'color', '18', 
      'get_prop set_default set_power toggle set_bright start_cf stop_cf set_scene cron_add cron_get cron_del set_ct_abxset_rgb', 
      'on', 100, 2, 4000, 16711680, 100, 35, 'Chambre');
      listLight.add(LightBlock(light));
    }
    return Wrap(
      runSpacing: 20,
      spacing: 10,
      direction: Axis.horizontal,
      children: listLight
    );
  }
}

class DiscoverButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final DiscoverBloc discoverBloc = BlocProvider.of<DiscoverBloc>(context);
    return Column(
      children: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () => discoverBloc.add(DiscoverEvent.refresh)
        ),
        BlocBuilder<DiscoverBloc, DiscoveryResponse>(builder: (context, yeelightList) {
          return Container(child: Text('toto'),);
        },)
      ],
    );
  }
}
