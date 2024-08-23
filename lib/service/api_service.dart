import 'package:api_testing/api/api.dart';
import 'package:api_testing/model/api_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  // Use the baseUrl from the Api class
  final String apiUrl = Api.baseUrl;

  Future<ApiModel> fetchData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return apiModelFromJson(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
