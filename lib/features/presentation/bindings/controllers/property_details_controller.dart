import 'package:get/get.dart';
import '../../domain/entities/landlord_models.dart';
import '../../domain/repositories/landlord_repository.dart';

class ApartmentDetailsController extends GetxController {
  final LandlordRepository _repository;

  ApartmentDetailsController(this._repository);

  ApartmentEntity? apartment;
  List<ServiceEntity> services = [];
  TenantEntity? tenant;
  List<PaymentEntity> payments = [];
  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    final String apartmentId = Get.arguments as String;
    loadFullApartmentDetails(apartmentId);
  }

  Future<void> loadFullApartmentDetails(String apartmentId) async {
    isLoading = true;
    update();

    apartment = await _repository.getApartmentById(apartmentId);
    services = await _repository.getServicesByApartment(apartmentId);
    tenant = await _repository.getTenantByApartment(apartmentId);
    payments = await _repository.getPaymentsByApartment(apartmentId);

    isLoading = false;
    update();
  }

  Future<void> collectPayment(String paymentId) async {
    await _repository.markPaymentAsPaid(paymentId);
    if (apartment != null) {
      payments = await _repository.getPaymentsByApartment(apartment!.id);
      update();
      Get.snackbar(
        'Ejary',
        'payment_collected'.tr,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}