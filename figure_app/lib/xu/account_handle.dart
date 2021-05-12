import 'package:figure_app/data/account_model.dart';

class AccountHandle{

  static int login(String username,String password ,List<Account> lsta)
  {
    // t ví dụ là username mốt muốn xài gì thì đổi lại ok
    var checkExist =  lsta.where((element) => element.username == username); // đổi chổ này
    if(checkExist.isEmpty)
    {
      return -1;
    }
    else
    {
      Account temp = lsta.firstWhere((element) => element.username == username); // đổi chổ này
      if(temp.password == password)
      {
        return 1;
      }
    }
    return 0;
  }
  static int isAccountExsit(String username,List<Account> lsta)
  {
    var checkExist =  lsta.where((element) => element.username == username);
    return checkExist.isEmpty ? 0 : 1;
  }
  static Account getAccountfromUserName(String username,List<Account> lsta)
  {
     Account temp = lsta.firstWhere((element) => element.username == username);
     return temp;
  }
  static Account getAccountByID(String id,List<Account> lsta)
  {
     Account temp = lsta.firstWhere((element) => element.id == id);
     return temp;
  }

}