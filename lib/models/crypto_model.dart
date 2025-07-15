import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currencyList = [
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
  'ZAR',
];

const List<String> cryptoList = ['BTC', 'ETH', 'LTC'];

class CryptoModel {
  const CryptoModel();

  Future getCryptoRate(String crypto, String currency) async {
    final url = Uri.parse(
      'https://rest.cryptoapis.io/market-data/exchange-rates/by-symbol/$crypto/$currency',
    );

    http.Response response = await http.get(
      url,
      headers: {
        'x-api-key': 'e4f129b6fe8f1674ce6b436f3c8a9c703904e409',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      var decodeData = jsonDecode(response.body);
      var assetRate = decodeData['data']['item']['rate'];
      return assetRate;
    } else {
      throw '${response.statusCode}: Problem with get request';
    }
  }
}
