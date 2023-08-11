import 'package:puppies/services/api_service.dart';

class PuppiesController {
  getAllPuppies() {
    ApiService api = ApiService(puppies: []);
    return api.fetchPost();
  }

  getOnePuppies(String id) {
    ApiService api = ApiService(puppies: []);
    return api.getOne(id);
  }
}
