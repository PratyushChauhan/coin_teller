import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String _apiKey = '484C8D16-7D90-4DC8-9341-1164B7A9169F';

  Future<double> getCryptoPrice(String crypto, String currency) async {
    String url =
        'https://rest.coinapi.io/v1/exchangerate/$crypto/$currency?apikey=$_apiKey';
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data = response.body;
      dynamic decodedData = jsonDecode(data);
      print(data);
      return decodedData['rate'];
    } else {
      throw ('error: Code ${response.statusCode}');
    }
  }
}
