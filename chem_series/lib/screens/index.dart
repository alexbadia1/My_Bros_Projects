import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  PanelController _controller = new PanelController();
  @override
  void initState() {
      super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Series Calculator'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 500.0,
            child: ListView.builder (
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox();
                }
            ),
          ),
          SlidingUpPanel(
            controller: _controller,
            isDraggable: false,
            backdropEnabled: true,
            backdropColor: Colors.black,
            backdropOpacity: 0.8,
            minHeight: MediaQuery.of(context).size.height * .0825,
            maxHeight: MediaQuery.of(context).size.height * .0826,
            collapsed: Container(
              height: MediaQuery.of(context).size.height * .0875,
              width: MediaQuery.of(context).size.width,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: Text('Creat new series'),
                  ),
                  Expanded(
                    flex: 1,
                    child: FlatButton(
                      child: Icon(Icons.add),
                      onPressed: () => _controller.open(),
                    ),
                  )
                ],
              ),
            ),
            panel: Container(),
          ),
        ],
      )
    );
  }
}
