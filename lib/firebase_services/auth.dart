import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:instagram_app/firebase_services/storage.dart';
import 'package:instagram_app/models/user.dart';
import 'package:instagram_app/shared/snackbar.dart';

class AuthMethods {
  register({
    required emailll,
    required passworddd,
    required context,
    required titleee,
    required usernameee,
    required imgName,
    required imgPath,
  }) async {
    String message = "ERROR => Not starting the code";

    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailll,
        password: passworddd,
      );

      message = "ERROR => Registered only";

// ______________________________________________________________________

      String urlll = await getImgURL(imgName: imgName, imgPath: imgPath);

// _______________________________________________________________________
// firebase firestore (Database)
      CollectionReference users =
          FirebaseFirestore.instance.collection('userSSS');

      UserDate userr = UserDate(
        email: emailll,
        password: passworddd,
        title: titleee,
        username: usernameee,
        profileImg: urlll,
      );

      users
          .doc(credential.user!.uid)
          .set(userr.convert2Map())
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));

      message = " Registered & User Added 2 DB ♥";
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, "ERROR :  ${e.code} ");
    } catch (e) {
      print(e);
    }

    showSnackBar(context, message);
  }
}
