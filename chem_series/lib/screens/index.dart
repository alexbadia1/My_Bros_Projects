import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:chemseries/components/series_card.dart';
import 'package:chemseries/series_data/lymanSeries.dart';
import 'package:chemseries/series_data/balmerSeries.dart';
import 'package:chemseries/series_data/paschenSeries.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _formKey = new GlobalKey<FormState>();
  int _input_num;
  List<Widget> _allSeries = [];
  List<LymanSeries> _allLymanSeries = [];
  List<BalmerSeries> _allBalmerSeries = [];
  List<PaschenSeries> _allPaschenSeries = [];

  bool duplicateLyman(){
    int pos = 0;
    bool found = false;
    while (pos < _allLymanSeries.length && !found) {
      if (_input_num == _allLymanSeries[pos].number) {
        found = true;
      } else pos++;
    }//while
    return found;
  }//duplicateLyman

  bool duplicateBalmer(){
    bool found = false;
    int pos = 0;
    while (pos < _allBalmerSeries.length && !found) {
      if (_input_num == _allBalmerSeries[pos].number) {
        found = true;
      } else pos++;
    }//while
    return found;
  }//duplicateBalmer

  bool duplicatePaschen(){
    bool found = false;
    int pos = 0;
    while (pos < _allPaschenSeries.length && !found) {
      if (_input_num == _allPaschenSeries[pos].number) {
        found = true;
      } else pos++;
    }//while
    return found;
  }//duplicatePashcen

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
            height: 500.0,
            child: myList
          ),
          bottomNavigationBar: BottomAppBar(
            child: Form(
                key: _formKey,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        validator: (String value) {

                          _input_num = toInt(value);

                          if (duplicateLyman() || duplicateBalmer() || duplicatePaschen()){
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
                            //Create the series
                            _allLymanSeries.add(LymanSeries(_input_num));
                            print('Lyman series added to list');
                            _allBalmerSeries.add(BalmerSeries(_input_num));
                            print('Balmer series added to list');
                            _allPaschenSeries.add(PaschenSeries(_input_num));
                            print('Paschen series added to list');

                            //Add a new series card
                            _allSeries.add(seriesCard());

                            setState(() {
                              print('Set state called');
                              myList = new ListView.builder(
                                  itemCount: _allSeries.length,
                                  itemBuilder: (BuildContext context, int index) {
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
