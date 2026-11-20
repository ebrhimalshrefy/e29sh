import 'package:get/get.dart';
import '../../domain/entities/landlord_models.dart';
import '../../domain/repositories/landlord_repository.dart';

class LandlordDashboardController extends GetxController
    with StateMixin<List<PropertyEntity>> {
  final LandlordRepository _repository;

  LandlordDashboardController(this._repository);

  final RxString searchQuery = ''.obs;
  List<PropertyEntity> _allProperties = [];

  @override
  void onInit() {
    super.onInit();
    loadProperties();
  }

  Future<void> loadProperties() async {
    change(null, status: RxStatus.loading());
    try {
      final list = await _repository.getProperties();
      _allProperties = list;
      _applyFilter();
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void updateSearch(String value) {
    searchQuery.value = value.trim().toLowerCase();
    _applyFilter();
  }

  void _applyFilter() {
    if (searchQuery.value.isEmpty) {
      change(_allProperties, status: RxStatus.success());
      return;
    }

    final filtered = _allProperties.where((p) {
      return p.nameAr.toLowerCase().contains(searchQuery.value) ||
          p.nameEn.toLowerCase().contains(searchQuery.value) ||
          p.districtAr.toLowerCase().contains(searchQuery.value) ||
          p.districtEn.toLowerCase().contains(searchQuery.value);
    }).toList();

    if (filtered.isEmpty) {
      change([], status: RxStatus.empty());
    } else {
      change(filtered, status: RxStatus.success());
    }
  }
}