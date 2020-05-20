import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:chemseries/components/series_card.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = new GlobalKey<FormState>();
  int _inputNum;
  List<int> _seriesNumbers = [];
  List<Widget> _allSeries = [];

  bool duplicateSeries() {
    int pos = 0;
    bool found = false;
    while (pos < _allSeries.length && !found) {
      if (_inputNum == _seriesNumbers[pos]) {
        found = true;
      } else
        pos++;
    } //while
    return found;
  } //duplicateSeries

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _bottom = MediaQuery.of(context).viewInsets.bottom;

    ListView myList = new ListView.builder(
        itemCount: _allSeries.length,
        itemBuilder: (BuildContext context, int index) {
          return _allSeries[index];
        });

    return Padding(
      padding: EdgeInsets.only(bottom: _bottom),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Series Calculator'),
          ),
          body: Container(
              height: MediaQuery.of(context).size.height,
              child: myList),
          bottomNavigationBar: BottomAppBar(
            child: Form(
                key: _formKey,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (String value) {
                          if (_formKey.currentState.validate()) {
                            //Add a new series card
                            _allSeries.add(seriesCard(context, _inputNum));
                            _seriesNumbers.add(_inputNum);

                            setState(() {
                              print('Set state called');
                              myList = new ListView.builder(
                                  itemCount: _allSeries.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return _allSeries[index];
                                  });
                            });
                          } else {
                            //Give a useful error message
                          }
                        },
                        validator: (String value) {
                          _inputNum = toInt(value);

                          if (duplicateSeries()) {
                            return 'You already have this series!';
                          }
                          return (!isNull(value) && isNumeric(value)
                              ? null
                              : 'Please enter a whole number greater than 0.');
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter number here:',
                        ),
                      ),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.chevron_right),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            //Add a new series card
                            _allSeries.add(seriesCard(context, _inputNum));
                            _seriesNumbers.add(_inputNum);

                            setState(() {
                              print('Set state called');
                              myList = new ListView.builder(
                                  itemCount: _allSeries.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return _allSeries[index];
                                  });
                            });
                          } else {
                            //Give a useful error message
                          }
                        },
                      ),
                    ),
                  ],
                )),
          )),
    );
  }
}
