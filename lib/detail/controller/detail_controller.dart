import 'package:get/get.dart';
import 'package:logger/logger.dart';

class DetailController extends GetxController {
  static DetailController get to => Get.find();
  final RxInt _currentNum = 1.obs;
  final RxInt _totalPrice = 132000.obs;
  var logger = Logger();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // 수량증가
  Future<void> addNumber() async {
    _currentNum.value++;
    _totalPrice.value = _totalPrice.value * _currentNum.value;
  }

  // 수량감소
  Future<void> removeNumber() async {
    _currentNum.value--;
    _totalPrice.value = 132000 * _currentNum.value;
    logger.d(_totalPrice.value * _currentNum.value);
    if (_currentNum.value < 1 || _currentNum.value == 1) {
      _currentNum.value = 1;
      _totalPrice.value = 132000;
    }
  }

  int get currentNum => _currentNum.value;
  int get totalPrice => _totalPrice.value;
}
