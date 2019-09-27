import 'package:picpay/features/base/BasePresenter.dart';
import 'package:picpay/features/home/home_contract.dart';
import 'package:picpay/models/User.dart';

class HomePresenter extends BasePresenter<HomeContract> {
  doListUser() {
    var list = List<User>();
    list.add(User("Lionan Dantas", "assets/images/lionan.jpg"));
    list.add(User("Sayonara Dantas", "assets/images/sayo.jpg"));
    list.add(User("Fabiana Monteiro", "assets/images/fabiana.jpg"));
    list.add(User("Jonas Cortelleti", "assets/images/jonas.jpg"));
    list.add(User("Estevão Dantas", ""));
    view.onListUsers(list);
  }
}
