import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class BankListProvider {

  Future<BankListModel> BanksTypes() async {
    var url = Uri.parse(API.GET_BANK_LIST );

    final response = await http.get(url);

    if(response.statusCode == 200) {
      return BankListModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }

}