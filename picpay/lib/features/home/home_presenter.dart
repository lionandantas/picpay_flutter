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
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Acai do final de semana!😜",1,3, "R\$ 8,00","4 minutos"));
  list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Pão de queijo do trabalho",1,3,"R\$ 72,59", "5 horas atrás"));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Paguei minhas divida",1,3,"R\$ 10,00","1 dia atrás"));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Devo não nego, pago quando puder",1,3,"R\$ 1,00", "2 dias atrás"));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Picolé do final de semana",1,3,"R\$ 10,00","5 dias atrás"));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Coca cola",1,3,"R\$ 4,00","2 semanas atrás"));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Acai do final de semana!😜",1,3,"R\$ 1,00","1 anos atrás"));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Acai do final de semana!😜",1,3,"R\$ 4,00","2 anos atrás"));

    view.onMyPayments(list);
  }
  doListAllPayment(){
 var list = List<Payment>();
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Acai do final de semana!😜",1,3, "R\$ 8,00","4 minutos"));
  list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Pão de queijo do trabalho",1,3,"R\$ 72,59", "5 horas atrás"));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Paguei minhas divida",1,3,"R\$ 10,00","1 dia atrás"));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Devo não nego, pago quando puder",1,3,"R\$ 1,00", "2 dias atrás"));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Picolé do final de semana",1,3,"R\$ 10,00","5 dias atrás"));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Coca cola",1,3,"R\$ 4,00","2 semanas atrás"));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Acai do final de semana!😜",1,3,"R\$ 1,00","1 anos atrás"));
    list.add(Payment("assets/images/lionan.jpg","@lionandantas","Lionan Dantas","Acai do final de semana!😜",1,3,"R\$ 4,00","2 anos atrás"));
    view.onAllPayments(list);
  }
}
