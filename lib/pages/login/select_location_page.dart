import 'package:flutter/material.dart';

import 'package:wechat_flutter/tools/wechat_flutter.dart';

class SelectLocationPage extends StatefulWidget {
  @override
  _SelectLocationPageState createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends State<SelectLocationPage> {
  late List state;

  Widget buildState(context, index) {
    var item = state[index];

    var content = new Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.symmetric(vertical: 20.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.2),
        ),
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text(
            '${item['name']}',
            style: TextStyle(fontSize: 15.0),
          ),
          new Text(
            '${item['code']}',
            style: TextStyle(fontSize: 15.0, color: Colors.green),
          ),
        ],
      ),
    );

    return new InkWell(
      child: content,
      onTap: () =>
          Navigator.pop(context, item['name'] + '  ' + '(${item['code']})'),
    );
  }

  @override
  Widget build(BuildContext context) {
    state = [
      {'name': context.l10n.australia, 'code': '+61'},
      {'name': context.l10n.macao, 'code': '+853'},
      {'name': context.l10n.canada, 'code': '+001'},
      {'name': context.l10n.uS, 'code': '+001'},
      {'name': context.l10n.taiwan, 'code': '+886'},
      {'name': context.l10n.hongKong, 'code': '+852'},
      {'name': context.l10n.singapore, 'code': '+65'},
      {'name': context.l10n.chinaMainland, 'code': '+86'},
    ];

    return new Scaffold(
      appBar: new ComMomBar(title: context.l10n.selectCountry),
      body: new ListView.builder(
          itemBuilder: buildState, itemCount: state.length),
    );
  }
}
