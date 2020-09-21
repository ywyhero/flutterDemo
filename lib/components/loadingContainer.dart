import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final bool isCover;


  LoadingContainer({@required this.child, @required this.isLoading, this.isCover = true});

  Widget get _loadngView{
    return Center(
      child: CircularProgressIndicator(),
    );
  }
    

  
  @override
  Widget build(BuildContext context) {
    return isCover ? !isLoading ? child : _loadngView : Stack(
      children: <Widget>[child, isLoading ? _loadngView : Container()],
    );
  }

}

