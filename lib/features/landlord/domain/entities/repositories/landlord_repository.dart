import '../entities/landlord_models.dart';

abstract class LandlordRepository {
  Future<List<PropertyEntity>> getProperties();
  Future<PropertyEntity> getPropertyById(String propertyId);
  Future<List<ApartmentEntity>> getApartmentsByProperty(String propertyId);
  Future<ApartmentEntity> getApartmentById(String apartmentId);
  Future<List<ServiceEntity>> getServicesByApartment(String apartmentId);
  Future<TenantEntity?> getTenantByApartment(String apartmentId);
  Future<List<PaymentEntity>> getPaymentsByApartment(String apartmentId);
  Future<PaymentEntity> markPaymentAsPaid(String paymentId);
}