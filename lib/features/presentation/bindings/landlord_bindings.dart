import 'package:get/get.dart';
import '../../domain/repositories/landlord_repository.dart';
import '../controllers/apartment_details_controller.dart';
import '../controllers/dashboard_controller.dart';
import '../controllers/property_details_controller.dart';

class LandlordDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandlordDashboardController>(
      () => LandlordDashboardController(Get.find<LandlordRepository>()),
    );
  }
}

class PropertyDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PropertyDetailsController>(
      () => PropertyDetailsController(Get.find<LandlordRepository>()),
    );
  }
}

class ApartmentDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApartmentDetailsController>(
      () => ApartmentDetailsController(Get.find<LandlordRepository>()),
    );
  }
}