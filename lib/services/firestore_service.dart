import 'package:firebase_core/firebase_core.dart';
import 'package:mart/consts/consts.dart';

class FireStoreSercices {
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  static getProducts(category) {
    return firestore
        .collection(productsCollection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }

  static getCart(uid) {
    return firestore
        .collection(cartCollection)
        .where("added_by", isEqualTo: uid)
        .snapshots();
  }

  static deleteCartItem(docId) {
    return firestore.collection(cartCollection).doc(docId).delete();
  }
}
