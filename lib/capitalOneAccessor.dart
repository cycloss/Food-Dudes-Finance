import 'dart:io';

import 'package:http/http.dart' as http;
import 'apiKey.dart' as keyFile;
import 'dart:async';

const String apiUrl =
    "https://sandbox.capitalone.co.uk/developer-services-platform-pr/api/data/accounts";
const int newAccountQuantity = 2;

main(List<String> args) async {
  // http.StreamedResponse sres = await createAccounts();
  // String respStr = await sres.stream.bytesToString();
  // print(respStr);
  // sleep(Duration(seconds: 2));
  http.Response res = await fetchAccounts();
  String bod = res.body;
  print(bod);
}

Future<http.Response> fetchAccounts() {
  final Map<String, String> fetchHeaders = {
    'Authorization': 'Bearer ${keyFile.key}',
    'version': '1.0'
  };
  return http.get(apiUrl, headers: fetchHeaders);
}

//do not call this function many times
Future<http.StreamedResponse> createAccounts() {
  final Map<String, String> createHeaders = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${keyFile.key}',
    'version': '1.0',
  };

  Uri uri = Uri.tryParse("$apiUrl/create");

  http.Request req = http.Request(
    'POST',
    uri,
  );
  req.headers.addAll(createHeaders);
  req.body = "{\n    \"quantity\": $newAccountQuantity\n}";
  return req.send();
}

class Account {
  String accountId;
  String firstname;
  String phoneNumber;
  String developerId;
  String uci;
  String riskScore;
  String creditScore;
  String currencyCode;
  String productType;
  String email;
  String lastname;
  String homeAddress;
  String state;
  String creditLimit;
  String balance;

  Account(
      this.accountId,
      this.firstname,
      this.phoneNumber,
      this.developerId,
      this.uci,
      this.riskScore,
      this.creditScore,
      this.currencyCode,
      this.productType,
      this.email,
      this.lastname,
      this.homeAddress,
      this.state,
      this.creditLimit,
      this.balance);
}
