import 'package:flutter/material.dart';

class QrPage extends StatefulWidget {
  @override
  _QrPageState createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  @override
  Widget build(BuildContext context) {
    return getCameraView();
  }

  Widget getCameraView() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: getCameraOverlay(),
      color: Colors.yellow,
    );
  }

  Widget getCameraOverlay(){
    return Center(
        child: Container(
          decoration: BoxDecoration(
            // color: Color.fromRGBO(100, 300, 900, 0.4),
            color: Color.fromRGBO(0, 0, 0, 0),
            border: Border.all(
              color: Colors.grey
            ),
            borderRadius: BorderRadius.circular(10) 
          ),
          height: 220,
          width: double.infinity,
          child: getStackParts(),
      ),
    );
  }

  Widget getStackParts() {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Positioned(
        top: -10,
        child: Container(
          width: 1,
          height: 100,
          color: Colors.red,
        ),
        )
      ],
    );
  }
}