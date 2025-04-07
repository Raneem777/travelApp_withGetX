import 'package:f1/model/fakeData.dart';
import 'package:f1/model/travelModel.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Controller extends GetxController {
  
 TravelModel model=TravelModel.fromJson(fakeData);
  
}