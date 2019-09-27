import 'package:picpay/features/base/BasePresenter.dart';
import 'package:picpay/features/home/home_contract.dart';
import 'package:picpay/models/User.dart';

class HomePresenter extends BasePresenter<HomeContract> {
  doListUser() {
    var list = List<User>();
    list.add(User("Lionan Dantas", ""));
    list.add(User("Sayonara Dantas", ""));
    list.add(User("Fabiana Monteiro", "https://scontent.fvix1-1.fna.fbcdn.net/v/t1.0-9/70781952_2475392935841728_8093762425024675840_n.jpg?_nc_cat=102&_nc_oc=AQn2ESl9TeCdc-FaEputm0NUD6UeiFRp67tKIBy9h2E-FEzEOGgtf6M8uQXN1XjYA2M&_nc_ht=scontent.fvix1-1.fna&oh=ba901bd10f5f8a4fc5ba3c27027e0b6a&oe=5E3141D7"));
    list.add(User("Estevão Dantas", ""));
    view.onListUsers(list);
  }
}
