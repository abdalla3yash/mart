import 'package:get/get.dart';

import '../consts/consts.dart';

class CartController extends GetxController {
  var isLoading = false.obs;

  var cartTotalPrice = 0.0.obs;

  var paymentSelectedIndex = 0.obs;
  var deliveryAddressSelectedIndex = 0.obs;

  dynamic productSnapshot;
  dynamic deliveryAddress;
  var products = [];

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var streetAddressController = TextEditingController();
  var postalCodeController = TextEditingController();
  var cityController = TextEditingController();

  var addressSelectedIndex = 0.obs;

  calculateCartedAllProductPrice({required var data}) {
    cartTotalPrice.value = 0.0;
    for (var i = 0; i < data.length; i++) {
      cartTotalPrice.value =
          cartTotalPrice.value + double.parse(data[i]['tprice'].toString());
    }
  }
}
