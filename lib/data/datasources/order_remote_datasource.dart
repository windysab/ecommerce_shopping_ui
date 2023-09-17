import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;

import '../../common/global_variables.dart';
import '../models/order_request_model.dart';
import '../models/respons/order_response_model.dart';
import 'auth_local_datasource.dart';


class OrderRemoteDatasource {
  Future<Either<String, OrderResponseModel>> order(
      OrderRequestModel model) async {
    final tokenJwt = await AuthLocalDatasource().getToken();
    print(model.toRawJson());

    final response = await http.post(
      Uri.parse('${GlobalVariables.baseUrl}/api/orders'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $tokenJwt'
      },
      body: model.toRawJson(),
    );
    if (response.statusCode == 200) {
      return Right(OrderResponseModel.fromJson(response.body));
    } else {
      return const Left('server error');
    }
  }
}
