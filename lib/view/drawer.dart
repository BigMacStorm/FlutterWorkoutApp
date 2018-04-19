import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'dart:math' as math;

class GainsLogDrawerHeader extends StatefulWidget {
  const GainsLogDrawerHeader({
    Key key, 
    this.light,
  }) : super(key: key);

  final bool light;

  @override
  _GainsLogDrawerState createState() => new _GainsLogDrawerState();
}

class _GainsLogDrawerState extends State<GainsLogDrawerHeader> {
  
  MaterialColor _logoColor = Colors.green;

  @override 
  Widget build(BuildContext context) {
    final double systemTopPadding = MediaQuery.of(context).padding.top;

    Widget drawerHeader;

    drawerHeader = new DrawerHeader(
      decoration: new FlutterLogoDecoration(
        margin: new EdgeInsets.fromLTRB(12.0, 12.0 + systemTopPadding, 12.0, 12.0),
        style: FlutterLogoStyle.horizontal,
        lightColor: _logoColor.shade400,
        darkColor: _logoColor.shade900,
        textColor: const Color(0xFF9E9E9E)
      ),
      duration: const Duration(milliseconds: 750),
      child: new GestureDetector(
        onTap: () {
          final List<MaterialColor> logoColorOptions = <MaterialColor>[Colors.blue, Colors.amber, Colors.red, Colors.indigo, Colors.pink, Colors.purple];
          _logoColor = logoColorOptions[new math.Random().nextInt(logoColorOptions.length)];
        }
      )
    );



    return new Semantics(
      label: 'Flutter',
      child: drawerHeader
    );
  }
}

class GainsLogDrawer extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle aboutTextStyle = themeData.textTheme.body2;
    final TextStyle linkStyle = themeData.textTheme.body2.copyWith(color: themeData.accentColor);

    final Widget aboutItem = new AboutListTile(
      icon: const FlutterLogo(),
      applicationVersion: 'GainsLog App v0.1'
    );

    final Widget addItem = new ListTile(
      leading: const Icon(Icons.settings),
      title: const Text('Add exercise'),
      onTap: () { Navigator.popAndPushNamed(context, '/add'); }
    );

    final List<Widget> allDrawerItems = <Widget>[
      new GainsLogDrawerHeader(),
    ]
    ..addAll(<Widget>[
      const Divider(),
      addItem,
      aboutItem
    ]);

    return new Drawer(child: new ListView(primary: false, children: allDrawerItems));
  }
}