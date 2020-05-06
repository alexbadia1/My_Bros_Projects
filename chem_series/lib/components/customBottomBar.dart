import 'package:flutter/material.dart';

Expanded customBottomBar(BuildContext context, ) {
  return Expanded(
    flex: 2,
    child: Scaffold(
      backgroundColor: Colors.blue,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Icon(Icons.add),
        ),
        onPressed: () {
//            setState(() {
////              _controller.isPanelClosed()
////                  ? _controller.animatePanelToPosition(1.0)
////                  : _controller.animatePanelToPosition(0.0);
////            });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.orange,
        shape: CircularNotchedRectangle(),
        notchMargin: 4.0,
        ),
      ),
    );
}