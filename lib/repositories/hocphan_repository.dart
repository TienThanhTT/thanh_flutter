import '../models/hocphan.dart';
import '../services/api_services.dart';

class HocPhanRepository {
  final ApiService api = ApiService();
  Future<List<HocPhan>> get_ds_hocphan() async {
    List<HocPhan> list = [];
    var response = await api.get_ds_hocphan();
    if (response != null && response.statusCode == 200) {
      var data = response.data['data'];
      for (var item in data) {
        var hocphan = HocPhan.fromJson(item);
        list.add(hocphan);
      }
    }
    return list;
  }
}
