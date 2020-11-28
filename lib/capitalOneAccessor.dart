import 'package:http/http.dart' as http;
import 'apiKey.dart' as keyFile;
import 'dart:async';

const String apiUrl =
    "https://sandbox.capitalone.co.uk/developer-services-platform-pr/api/data/accounts";
const Map<String, String> headers = {
  'Authorization': 'Bearer ${keyFile.key}',
  'version': '1.0'
};

main(List<String> args) async {
  http.Response res = await fetchData();
  String bod = res.body;
  print(bod);
}

Future<http.Response> fetchData() {
  return http.get(apiUrl, headers: headers);
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
