import '../../domain/entities/landlord_models.dart';
import '../../domain/repositories/landlord_repository.dart';
import '../datasources/landlord_local_datasource.dart';

class LandlordRepositoryImpl implements LandlordRepository {
  final LandlordLocalDataSource _localDataSource;

  LandlordRepositoryImpl(this._localDataSource);

  @override
  Future<List<PropertyEntity>> getProperties() =>
      _localDataSource.fetchProperties();

  @override
  Future<PropertyEntity> getPropertyById(String propertyId) =>
      _localDataSource.fetchPropertyById(propertyId);

  @override
  Future<List<ApartmentEntity>> getApartmentsByProperty(String propertyId) =>
      _localDataSource.fetchApartmentsByProperty(propertyId);

  @override
  Future<ApartmentEntity> getApartmentById(String apartmentId) =>
      _localDataSource.fetchApartmentById(apartmentId);

  @override
  Future<List<ServiceEntity>> getServicesByApartment(String apartmentId) =>
      _localDataSource.fetchServicesByApartment(apartmentId);

  @override
  Future<TenantEntity?> getTenantByApartment(String apartmentId) =>
      _localDataSource.fetchTenantByApartment(apartmentId);

  @override
  Future<List<PaymentEntity>> getPaymentsByApartment(String apartmentId) =>
      _localDataSource.fetchPaymentsByApartment(apartmentId);

  @override
  Future<PaymentEntity> markPaymentAsPaid(String paymentId) =>
      _localDataSource.setPaymentPaid(paymentId);
}