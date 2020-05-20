import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

Card seriesCard(BuildContext context, int seriesNumber) {
  return Card(
    child: ListTile(
      title: Text('Series'),
      trailing: Text(toString(seriesNumber)),
      onTap: () {
        Navigator.pushNamed(context, '/cardDetails',
            arguments: <String, int>{'seriesNumber': seriesNumber});
      },
    ),
  );
}
