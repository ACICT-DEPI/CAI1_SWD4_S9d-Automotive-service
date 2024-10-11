abstract class AppStatus {}

class InitialAppState extends AppStatus {}

class RegisterByEmailDoneStatus extends AppStatus {}

class RegisterByEmailfaildStatus extends AppStatus {
  String error;
  RegisterByEmailfaildStatus(this.error);
}

class SignInByEmailDoneStatus extends AppStatus {}

class SignInByEmailfaildStatus extends AppStatus {
  String error;
  SignInByEmailfaildStatus(this.error);
}

class IsSecureState extends AppStatus {}

class BottomNavigationBarState extends AppStatus {}

class showAwsomeDialog extends AppStatus {}

class loadingState extends AppStatus {}

class HomeStatesuccess extends AppStatus {}

class HomeStatefailer extends AppStatus {}

class AddFavouriteDone extends AppStatus {}

class RemoveFavouriteDone extends AppStatus {}
//class HomeStatefailer extends AppStatus {}
