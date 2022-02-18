import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sixvalley_vendor_app/data/model/response/base/api_response.dart';
import 'package:sixvalley_vendor_app/data/model/response/base/error_response.dart';
import 'package:sixvalley_vendor_app/data/model/response/shipping_model.dart';
import 'package:sixvalley_vendor_app/data/repository/shipping_repo.dart';
import 'package:sixvalley_vendor_app/helper/api_checker.dart';
import 'package:sixvalley_vendor_app/localization/language_constrants.dart';
import 'package:sixvalley_vendor_app/view/base/custom_snackbar.dart';

import 'auth_provider.dart';

class ShippingProvider extends ChangeNotifier {
  final ShippingRepo shippingRepo;
  ShippingProvider({@required this.shippingRepo});
  List<ShippingModel> _shippingList;
  List<ShippingModel> get  shippingList => _shippingList;
  int _shippingIndex;
  int get shippingIndex => _shippingIndex;
  bool _isLoading = false;
  bool get isLoading => _isLoading;


  Future<void> getShippingList(BuildContext context, String token) async {
    _shippingIndex = null;
    ApiResponse apiResponse = await shippingRepo.getShippingMethod(token);
    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      _shippingList = [];
      apiResponse.response.data.forEach((shippingMethod) => _shippingList.add(ShippingModel.fromJson(shippingMethod)));
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
  }


  Future addShippingMethod(ShippingModel shipping, Function callback) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await shippingRepo.addShipping(shipping);

    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      callback(true, '');
      notifyListeners();
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors[0].message);
        errorMessage = errorResponse.errors[0].message;
      }
      callback(false, errorMessage);
    }
    _isLoading = false;
    notifyListeners();
  }
  Future updateShippingMethod( String title,String duration,double cost, int id, Function callback) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await shippingRepo.updateShipping(title,duration,cost,id);

    if (apiResponse.response != null && apiResponse.response.statusCode == 200) {
      callback(true, '');
    } else {
      String errorMessage;
      if (apiResponse.error is String) {
        print(apiResponse.error.toString());
        errorMessage = apiResponse.error.toString();
      } else {
        ErrorResponse errorResponse = apiResponse.error;
        print(errorResponse.errors[0].message);
        errorMessage = errorResponse.errors[0].message;
      }
      callback(false, errorMessage);
    }
    _isLoading = false;
    notifyListeners();
  }
  Future<void> deleteShipping(BuildContext context,int id) async {
    _isLoading = true;
    notifyListeners();
    print('-------$id');
    ApiResponse response = await shippingRepo.deleteShipping(id);
    if(response.response.statusCode == 200) {
      Navigator.pop(context);
      showCustomSnackBar(getTranslated('shipping_method_deleted_successfully', context),context, isError: false);
     getShippingList(context,Provider.of<AuthProvider>(context,listen: false).getUserToken());
    }else {
      ApiChecker.checkApi(context,response);
    }
    _isLoading = false;
    notifyListeners();
  }

}