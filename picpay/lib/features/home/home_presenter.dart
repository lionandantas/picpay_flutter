import 'package:picpay/features/base/BasePresenter.dart';
import 'package:picpay/features/home/home_contract.dart';
import 'package:picpay/models/Payment.dart';
import 'package:picpay/models/User.dart';

class HomePresenter extends BasePresenter<HomeContract> {
  doListUser() {
    var list = List<User>();
    list.add(User("Lionan Dantas", "assets/images/lionan.jpg"));
    list.add(User("Sayonara Dantas", "assets/images/sayo.jpg"));
    list.add(User("Fabiana Monteiro", "assets/images/fabiana.jpg"));
    list.add(User("Jonas Cortelleti", "assets/images/jonas.jpg"));
    list.add(User("Estevão Rodrigues", "assets/images/avatar_person.png"));
    view.onListUsers(list);
  }

  doListMyPayment(){
    var list = List<Payment>();
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Sorvete de ontem a noite! 🍦😜",1,3));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Sorvete de ontem a noite! 🍦😜",1,3));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Sorvete de ontem a noite! 🍦😜",1,3));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Sorvete de ontem a noite! 🍦😜",1,3));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Sorvete de ontem a noite! 🍦😜",1,3));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Sorvete de ontem a noite! 🍦😜",1,3));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Sorvete de ontem a noite! 🍦😜",1,3));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Sorvete de ontem a noite! 🍦😜",1,3));

    view.onMyPayments(list);
  }
  doListAllPayment(){
 var list = List<Payment>();
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Sorvete de ontem a noite! 🍦😜",1,3));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Sorvete de ontem a noite! 🍦😜",1,3));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Sorvete de ontem a noite! 🍦😜",1,3));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Sorvete de ontem a noite! 🍦😜",1,3));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Sorvete de ontem a noite! 🍦😜",1,3));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Sorvete de ontem a noite! 🍦😜",1,3));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Sorvete de ontem a noite! 🍦😜",1,3));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Sorvete de ontem a noite! 🍦😜",1,3));

    view.onAllPayments(list);
  }
}
