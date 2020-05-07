import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _bottom = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: _bottom),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Series Calculator'),
          ),
          body: Container(
            height: 500.0,
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox();
                }),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Form(
                key: _formKey,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextFormField(
                        validator: (String value) {
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
                          if (_formKey.currentState.validate() == null) {
                            //Create the series


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
