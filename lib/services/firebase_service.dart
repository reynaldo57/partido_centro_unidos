

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  String collection;

  FirestoreService({required this.collection});

  late CollectionReference _firestoreReferences =
  FirebaseFirestore.instance.collection(this.collection);

  Future<List<Map<String, dynamic>>>getAdministrators() async{
    List<Map<String, dynamic>> administrators = [];
    QuerySnapshot _collectionReference = await _firestoreReferences.orderBy('order', descending: true).get();
    _collectionReference.docs.forEach((QueryDocumentSnapshot element){
      Map<String, dynamic> administratorMap = element.data() as Map<String, dynamic>;
      administratorMap["id"] = element.id;
      administrators.add(administratorMap);
    });
    return administrators;
  }


  Future<List<Map<String, dynamic>>> getContents({String? categooryId}) async{
    List<Map<String, dynamic>> contents = [];
    QuerySnapshot _collectionReference = await _firestoreReferences.where('category', isEqualTo:
    categooryId).get();
    _collectionReference.docs.forEach((QueryDocumentSnapshot element) {
      Map<String, dynamic> content = element.data() as Map<String, dynamic>;
      contents.add(content);
    });
    return contents;
  }
}