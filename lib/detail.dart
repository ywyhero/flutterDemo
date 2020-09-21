import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
    Widget build(BuildContext context) {
        final Map args = ModalRoute.of(context).settings.arguments;
        return Scaffold(
            appBar: AppBar(
                title: Text('Detail Page')
            ),
            body: ListView(
                children: <Widget>[
                    Text("id:${args['id']}", textAlign: TextAlign.left),
                    Text("title:${args['title']}", textAlign: TextAlign.left),
                    Text("subtitle:${args['subtitle']}", textAlign: TextAlign.left)
                ],
            ),
        );
    }
}