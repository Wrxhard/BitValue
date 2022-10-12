import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'USD',
  'AUD',
  'VND',
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
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];
const BinanceapiKey='peUI8dyIPSyUQaICU57v4R8nwQt6rKFYpJ7HZXn3xbctMUTnqbfZK4hQjjo3QwEr';
const coinAPIURL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker';
const apiKey = 'NDQ4YWQwMDc5NzdiNDUxMDlhOWUzN2ViYzM1NDk3YTE';

class CoinData {
  Future getCoinData(String selectedCurrency) async {
    Map<String, dynamic> map1={};
    //TODO 4: Use a for loop here to loop through the cryptoList and request the data for each of them in turn.
    //TODO 5: Return a Map of the results instead of a single value.
    for (var items in cryptoList) {
      String requestURL = '$coinAPIURL/$items$selectedCurrency';
      http.Response response = await http.get(
          Uri.parse(requestURL),
          headers: {
            'x-ba-key': apiKey
          }
      );
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var lastPrice = decodedData['last'];
        map1.update(items, (v) => "",ifAbsent: () => lastPrice);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
     }
    return map1;
    }
}
