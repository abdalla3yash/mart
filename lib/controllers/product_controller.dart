import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mart/consts/consts.dart';
import 'package:mart/models/category_Model.dart';

class ProductController extends GetxController {
  var subcat = [];
  var quentity = 0.obs;
  var colorIndex = 0.obs;
  var totalPrice = 0.obs;

  getSubCategories(title) async {
    subcat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s =
        decoded.categories.where((element) => element.name == title).toList();

    for (var e in s[0].subcategories) {
      subcat.add(e);
    }
  }

  changeColorIndex(index) {
    colorIndex.value = index;
  }

  increaseQuentity(totalQuentity) {
    if (quentity.value < totalQuentity) {
      quentity.value++;
    }
  }

  decreaseQuentity() {
    if (quentity.value > 0) {
      quentity.value--;
    }
  }

  calculateTotalPrice(price) {
    totalPrice.value = price * quentity.value;
  }

  addToCart({title, img, sellername, color, qty, tprice, context}) async {
    await firestore.collection(cartCollection).doc().set({
      'title': title,
      'img': img,
      'sellername': sellername,
      'color': color,
      'qty': qty,
      'tprice': tprice,
      'added_by': currentUser!.uid
    }).catchError((error) {
      VxToast.show(context, msg: error.toString());
    });
  }

  resetValues() {
    totalPrice.value = 0;
    quentity.value = 0;
    colorIndex.value = 0;
  }

  addToWishlist()async{
    
  }
}
