import 'package:e301_login/ui/views/no_page_found_view.dart';
import 'package:fluro/fluro.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = Handler(
    handlerFunc: (context, parameters){
      return NoPageFoundView();
    } 
  );
}
