import '../../domain/entities/landlord_models.dart';

abstract class LandlordLocalDataSource {
  Future<List<PropertyEntity>> fetchProperties();
  Future<PropertyEntity> fetchPropertyById(String propertyId);
  Future<List<ApartmentEntity>> fetchApartmentsByProperty(String propertyId);
  Future<ApartmentEntity> fetchApartmentById(String apartmentId);
  Future<List<ServiceEntity>> fetchServicesByApartment(String apartmentId);
  Future<TenantEntity?> fetchTenantByApartment(String apartmentId);
  Future<List<PaymentEntity>> fetchPaymentsByApartment(String apartmentId);
  Future<PaymentEntity> setPaymentPaid(String paymentId);
}

class LandlordLocalDataSourceImpl implements LandlordLocalDataSource {
  final List<PropertyEntity> _properties = const [
    PropertyEntity(
      id: 'p1',
      nameAr: 'عمارة النور السكنية',
      nameEn: 'Al-Noor Residential Building',
      districtAr: 'حي حدة',
      districtEn: 'Hadda District',
      floorsCount: 5,
    ),
    PropertyEntity(
      id: 'p2',
      nameAr: 'مجمع الصفاء للأملاك',
      nameEn: 'Al-Safa Property Complex',
      districtAr: 'شارع الستين',
      districtEn: 'Sixty Street',
      floorsCount: 4,
    ),
  ];

  final List<ApartmentEntity> _apartments = [
    const ApartmentEntity(
      id: 'a1',
      propertyId: 'p1',
      unitNumber: '101',
      floorNumber: 1,
      monthlyRent: 450,
      isOccupied: true,
      specs: ApartmentSpecEntity(
        id: 'sp1',
        apartmentId: 'a1',
        roomsCount: 3,
        bathroomsCount: 2,
        areaSqm: 135,
        isFurnished: true,
      ),
    ),
    const ApartmentEntity(
      id: 'a2',
      propertyId: 'p1',
      unitNumber: '202',
      floorNumber: 2,
      monthlyRent: 380,
      isOccupied: false,
      specs: ApartmentSpecEntity(
        id: 'sp2',
        apartmentId: 'a2',
        roomsCount: 2,
        bathroomsCount: 1,
        areaSqm: 95,
        isFurnished: false,
      ),
    ),
    const ApartmentEntity(
      id: 'a3',
      propertyId: 'p2',
      unitNumber: '301',
      floorNumber: 3,
      monthlyRent: 520,
      isOccupied: true,
      specs: ApartmentSpecEntity(
        id: 'sp3',
        apartmentId: 'a3',
        roomsCount: 4,
        bathroomsCount: 3,
        areaSqm: 170,
        isFurnished: true,
      ),
    ),
  ];

  final List<ServiceEntity> _services = const [
    ServiceEntity(
      id: 's1',
      apartmentId: 'a1',
      nameAr: 'كهرباء وصيانة عامة',
      nameEn: 'Electricity & Maintenance',
      monthlyCost: 40,
      isActive: true,
    ),
    ServiceEntity(
      id: 's2',
      apartmentId: 'a1',
      nameAr: 'إنترنت ألياف بصرية',
      nameEn: 'Fiber Internet',
      monthlyCost: 25,
      isActive: true,
    ),
    ServiceEntity(
      id: 's3',
      apartmentId: 'a2',
      nameAr: 'مياه وحراسة المبنى',
      nameEn: 'Water & Building Security',
      monthlyCost: 30,
      isActive: true,
    ),
    ServiceEntity(
      id: 's4',
      apartmentId: 'a3',
      nameAr: 'تكييف مركزي وصيانة',
      nameEn: 'Central AC & Maintenance',
      monthlyCost: 60,
      isActive: true,
    ),
  ];

  final List<TenantEntity> _tenants = const [
    TenantEntity(
      id: 't1',
      fullName: 'محمد عبدالله اليمني',
      phone: '770123456',
      apartmentId: 'a1',
      leaseStartDate: '2026-01-01',
    ),
    TenantEntity(
      id: 't2',
      fullName: 'سامي حسن الحمادي',
      phone: '733987654',
      apartmentId: 'a3',
      leaseStartDate: '2026-03-15',
    ),
  ];

  final List<PaymentEntity> _payments = [
    const PaymentEntity(
      id: 'pay1',
      tenantId: 't1',
      apartmentId: 'a1',
      amount: 450,
      paymentDate: '2026-10-01',
      isPaid: true,
    ),
    const PaymentEntity(
      id: 'pay2',
      tenantId: 't1',
      apartmentId: 'a1',
      amount: 450,
      paymentDate: '2026-11-01',
      isPaid: false,
    ),
    const PaymentEntity(
      id: 'pay3',
      tenantId: 't2',
      apartmentId: 'a3',
      amount: 520,
      paymentDate: '2026-11-01',
      isPaid: false,
    ),
  ];

  @override
  Future<List<PropertyEntity>> fetchProperties() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _properties;
  }

  @override
  Future<PropertyEntity> fetchPropertyById(String propertyId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _properties.firstWhere((p) => p.id == propertyId);
  }

  @override
  Future<List<ApartmentEntity>> fetchApartmentsByProperty(
    String propertyId,
  ) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _apartments.where((a) => a.propertyId == propertyId).toList();
  }

  @override
  Future<ApartmentEntity> fetchApartmentById(String apartmentId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _apartments.firstWhere((a) => a.id == apartmentId);
  }

  @override
  Future<List<ServiceEntity>> fetchServicesByApartment(
    String apartmentId,
  ) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _services.where((s) => s.apartmentId == apartmentId).toList();
  }

  @override
  Future<TenantEntity?> fetchTenantByApartment(String apartmentId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    try {
      return _tenants.firstWhere((t) => t.apartmentId == apartmentId);
    } catch (_) {
      return null;
    }
  }

  @override
  Future<List<PaymentEntity>> fetchPaymentsByApartment(
    String apartmentId,
  ) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return _payments.where((p) => p.apartmentId == apartmentId).toList();
  }

  @override
  Future<PaymentEntity> setPaymentPaid(String paymentId) async {
    await Future.delayed(const Duration(milliseconds: 250));
    final idx = _payments.indexWhere((p) => p.id == paymentId);
    if (idx != -1) {
      _payments[idx] = _payments[idx].copyWith(isPaid: true);
      return _payments[idx];
    }
    throw Exception('Payment not found');
  }
}