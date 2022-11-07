import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  DropdownButton<String> showAndroidDropdown() {
    List<DropdownMenuItem<String>> menuItems = [];
    for (String i in currenciesList) {
      menuItems.add(DropdownMenuItem(
        child: Text(i),
        value: i,
      ));
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: menuItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
        });
        print(value);
      },
    );
  }

  CupertinoPicker showIOSPicker() {
    List<Text> pickerItems = [];
    for (String i in currenciesList) {
      pickerItems.add(Text(i));
    }
    return CupertinoPicker(
      magnification: 1.22,
      squeeze: 1.2,
      useMagnifier: false,
      itemExtent: 32,
      // This is called when selected item is changed.
      onSelectedItemChanged: (int selectedItem) {
        setState(() {
          print(selectedItem);
        });
      },
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Center(
              child: Platform.isIOS ? showIOSPicker() : showAndroidDropdown(),
            ),
          ),
        ],
      ),
    );
  }
}
