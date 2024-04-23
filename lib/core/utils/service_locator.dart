
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:notes/core/utils/firebase_service.dart';
import 'package:notes/features/auth/data/register_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {

  

   getIt.registerSingleton(
   FirebaseService(FirebaseAuth.instance)
  );
  
  getIt.registerSingleton(
    RegisterRepoImpl(getIt.get<FirebaseService>()),
  );
  
 

  
}
