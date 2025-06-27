import 'package:get/get.dart';
import 'package:t_store/utils/helpers/network_manager.dart';

// somethings we want to trigger when the application launch
// and we dont want to call get.put again and again
// whenever application run it will automatically trigger this general binding
// and instance will be created
class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
