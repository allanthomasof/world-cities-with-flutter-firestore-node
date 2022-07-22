import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../firebase_options.dart';

class CountryService {
  static Future<dynamic> getCountries() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
    );
    
    CollectionReference collection = FirebaseFirestore.instance.collection('world-cities');
    QuerySnapshot querySnapshot = await collection.get();
    final data = querySnapshot.docs.map((doc) => doc.data()).toList();
    return data.isNotEmpty ? data : [];
  }
}
