import 'package:chemseries/series_data/balmerSeries.dart';
import 'package:chemseries/series_data/lymanSeries.dart';
import 'package:chemseries/series_data/paschenSeries.dart';
import 'package:string_validator/string_validator.dart';
import 'package:flutter/material.dart';

class CardDetails extends StatefulWidget {
  @override
  _CardDetailsState createState() => _CardDetailsState();
}

class _CardDetailsState extends State<CardDetails> {
  String title = "Lyman Series";
  List<DataRow> table = [];
  List<DataRow> lData = [];
  List<DataRow> bData = [];
  List<DataRow> pData = [];

  Map _myData;
  int _mySeriesNumber;

  DataRow createRow([series, position]) {
    return DataRow(cells: <DataCell>[
      DataCell(
        Text(
          toString(series.currentN[position] + 1),
          style: TextStyle(fontSize: 10.0),
        ),
      ),
      DataCell(
        Text(
          toString(series.energy[position]),
          style: TextStyle(fontSize: 10.0),
        ),
      ),
      DataCell(
        Text(
          toString(series.lambda[position]),
          style: TextStyle(fontSize: 10.0),
        ),
      ),
      DataCell(
        Text(
          series.frequency[position].toStringAsExponential(),
          style: TextStyle(fontSize: 10.0),
        ),
      ),
    ]);
  }

  DataTable customDataTable(List<DataRow> data) {
    return DataTable(columns: [
      DataColumn(label: Text('n')),
      DataColumn(label: Text('Energy (J)', style: TextStyle(fontWeight: FontWeight.bold),)),
      DataColumn(label: Text('Lambda (nm)', style: TextStyle(fontWeight: FontWeight.bold),)),
      DataColumn(label: Text('Frequency (Hz)', style: TextStyle(fontWeight: FontWeight.bold),)),
    ], rows: data);
  }

  @override
  Widget build(BuildContext context) {
    _myData = ModalRoute.of(context).settings.arguments;
    _mySeriesNumber = _myData['seriesNumber'];

    LymanSeries lyman = new LymanSeries(_mySeriesNumber);
    BalmerSeries balmer = new BalmerSeries(_mySeriesNumber);
    PaschenSeries paschen = new PaschenSeries(_mySeriesNumber);

    lyman.calculateLymanSeries();
    balmer.calculateBalmerSeries();
    paschen.calculatePaschenSeries();

    lData.clear();
    bData.clear();
    pData.clear();
    for (int i = 0; i < lyman.frequency.length; i++) {
      lData.add(createRow(lyman, i));
    } //while

    for (int i = 0; i < balmer.frequency.length; i++) {
      bData.add(createRow(balmer, i));
    } //while

    for (int i = 0; i < paschen.frequency.length; i++) {
      pData.add(createRow(paschen, i));
    } //while

    if (title == "Lyman Series") {
      table = lData;
    } else if (title == "Balmer Series") {
      table = bData;
    } else
      table = pData;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[customDataTable(table)],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              height: MediaQuery.of(context).size.height * .08,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: RawMaterialButton(
                        child: Text("Lyman"),
                        splashColor: Colors.grey,
                        onPressed: () {
                          setState(() {
                            title = "Lyman Series";
                            lData.clear();
                          });
                        }),
                  ),
                  VerticalDivider(
                    thickness: 1.0,
                    color: Colors.black,
                    indent: MediaQuery.of(context).size.height * .01,
                    endIndent: MediaQuery.of(context).size.height * .01,
                  ),
                  Expanded(
                    child: RawMaterialButton(
                        child: Text("Balmer"),
                        splashColor: Colors.grey,
                        onPressed: () {
                          setState(() {
                            title = "Balmer Series";
                            bData.clear();
                          });
                        }),
                  ),
                  VerticalDivider(
                    thickness: 1.0,
                    color: Colors.black,
                    indent: MediaQuery.of(context).size.height * .01,
                    endIndent: MediaQuery.of(context).size.height * .01,
                  ),
                  Expanded(
                    child: RawMaterialButton(
                        child: Text("Paschen"),
                        splashColor: Colors.grey,
                        onPressed: () {
                          setState(() {
                            title = "Paschen Series";
                            pData.clear();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
