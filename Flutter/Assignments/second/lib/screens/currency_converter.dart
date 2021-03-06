import 'package:flutter/material.dart';
import 'package:second/services/api_client.dart';
import 'package:second/widgets/drop_down.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:convert';

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  TextEditingController controller = TextEditingController()..text = "1";
  ApiClient client = ApiClient();
  String? fromCountry = "USD";
  String? toCountry = "PKR";
  double? rate;
  List<String>? currencies = [];
  Map<String, Map<String, double>> rates = {};
  String? answer;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    (() async {
      List<String> list = await client.getCurrencies();
      setState(() {
        currencies = list;
        currencies?.sort();
      });
    })();
    getResult();
  }

  // Future<void> storeCountriesAndRatesLocally() async {
  //   List<String> currencies = await client.getCurrencies();
  //   currencies.sort();
  //   Map<String, Map<String, double>> rates = {};
  //   for (var leftCurrency in currencies) {
  //     Map<String, double> leftCurrencyConversiontForAll = {};
  //     for (var rightCurrency in currencies) {
  //       double rate = await client.getRate(leftCurrency, rightCurrency);
  //       leftCurrencyConversiontForAll[rightCurrency] = rate;
  //     }
  //     rates[leftCurrency] = leftCurrencyConversiontForAll;
  //   }
  //   final SharedPreferences prefs = await _prefs;
  //   await prefs.setStringList('currencies', currencies);
  //   String conversion = json.encode(rates);
  //   await prefs.setString('rates', conversion);
  // }

  // Future<void> getCountriesAndRatesLocally() async {
  //   final SharedPreferences prefs = await _prefs;
  //   currencies = prefs.getStringList('currencies');
  //   String? stringMapRates = prefs.getString('rates');
  //   rates = json.decode(stringMapRates!);
  // }

  getResult() async {
    rate = await client.getRate(fromCountry, toCountry);
    setState(() {
      answer = (rate! * double.parse(controller.text)).toStringAsFixed(3);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "Currency Converter",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                width: 200,
                height: 200,
                child: Column(
                  children: [
                    Text(
                      "Exchange Rates",
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      '$answer',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 350,
              child: TextField(
                onSubmitted: (String val) {
                  setState(() {
                    getResult();
                  });
                },
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: "Enter an amount to convert",
                    labelText: "Amount",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(),
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      "From",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    customDropDown(currencies!, (val) {
                      setState(() {
                        fromCountry = val;
                        getResult();
                      });
                    }, val: fromCountry)
                  ],
                ),
                FloatingActionButton(
                    onPressed: () {
                      String? temp = fromCountry;
                      setState(() {
                        fromCountry = toCountry;
                        toCountry = temp;
                      });
                      getResult();
                    },
                    child: Icon(Icons.swap_horiz)),
                Column(
                  children: [
                    Text(
                      "To",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    customDropDown(currencies!, (val) {
                      setState(() {
                        toCountry = val;
                        getResult();
                      });
                    }, val: toCountry)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
