import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {


  @override
  Future onRequest(RequestOptions options) {
    //Appelée à chaque requêtes
    //On peut par exemple ajouter un header à la volée comme ceci:
    options.headers.addAll({"Authorization": "Bearer[token]"});
    return super.onRequest(options);
  }

  @override
  Future onError(DioError err) {
    // Appelée en cas d'erreur on peut imaginer effectuer un traitement
    // d'erreur poussé pour afficher des messages d'erreurs custom
    return super.onError(err);
  }

  @override
  Future onResponse(Response response) {
    // Appelée en cas de succès de la requête
    // Permet de faire un traitement au préalable avant de renvoyer la réponse
    return super.onResponse(response);
  }
}