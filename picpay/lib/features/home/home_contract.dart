import 'package:picpay/features/base/BaseViewCallback.dart';
import 'package:picpay/models/User.dart';

abstract class HomeContract extends BaseViewCallback {
  onListUsers(List<User> users);
}
