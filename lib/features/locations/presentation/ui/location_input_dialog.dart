import 'package:flutter/material.dart';
import 'package:foyer_demo/core/database/database.dart';
import 'package:foyer_demo/features/locations/domain/entity/location.dart';
import 'package:foyer_demo/injectable.dart';

class LocationInputDialog extends StatefulWidget {
  const LocationInputDialog({super.key});

  @override
  _LocationInputDialogState createState() => _LocationInputDialogState();
}

class _LocationInputDialogState extends State<LocationInputDialog> {
  final _formKey = GlobalKey<FormState>(); // GlobalKey for form state

  TextEditingController latitudeController = TextEditingController();
  TextEditingController longitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Enter Latitude and Longitude'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: latitudeController,
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              decoration: InputDecoration(labelText: 'Latitude'),
              validator: (value) {
                double? latitude = double.tryParse(value ?? '');
                if (latitude == null || !Location.isValidLatitude(latitude)) {
                  return 'Invalid latitude value';
                }
                return null;
              },
              onChanged: (value) {
                // if (value.isEmpty) {
                //   _formKey.currentState!.reset();
                // }
              },
            ),
            TextFormField(
              controller: longitudeController,
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              decoration: InputDecoration(labelText: 'Longitude'),
              validator: (value) {
                double? longitude = double.tryParse(value ?? '');
                if (longitude == null ||
                    !Location.isValidLongitude(longitude)) {
                  return 'Invalid longitude value';
                }
                return null;
              },
              onChanged: (value) {
                // if (value.isEmpty) {
                //   _formKey.currentState!.reset();
                // }
              },
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            //getIt<DatabaseHelper>().deleteDatabase();
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              double latitude = double.tryParse(latitudeController.text) ?? 0.0;
              double longitude =
                  double.tryParse(longitudeController.text) ?? 0.0;

              Navigator.of(context)
                  .pop(Location(latitude: latitude, longitude: longitude));
            }
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
