import 'package:get/get.dart';
import '../../domain/entities/landlord_models.dart';
import '../../domain/repositories/landlord_repository.dart';

class PropertyDetailsController extends GetxController {
  final LandlordRepository _repository;

  PropertyDetailsController(this._repository);

  PropertyEntity? property;
  List<ApartmentEntity> apartments = [];
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    final String propertyId = Get.arguments as String;
    loadPropertyData(propertyId);
  }

  Future<void> loadPropertyData(String propertyId) async {
    isLoading = true;
    update();
    property = await _repository.getPropertyById(propertyId);
    apartments = await _repository.getApartmentsByProperty(propertyId);
    isLoading = false;
    update();
  }
}