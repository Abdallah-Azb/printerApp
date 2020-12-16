import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/src/model/model_data_api.dart';
import 'package:untitled2/src/model/user_info.dart';
import 'package:untitled2/src/provider/modal_hud.dart';
import 'package:untitled2/src/sercices/updata_firebase.dart';
import 'package:untitled2/src/widget/coustom_textfiled.dart';
import 'package:get/get.dart';

class TakeInfoUser extends StatefulWidget {
  static String id = "infouser";

  var name, phone, whats, address;
  var _store = Store();

  @override
  _TakeInfoUserState createState() => _TakeInfoUserState();
}

class _TakeInfoUserState extends State<TakeInfoUser> {
  final _globalkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    //  List<Data> tackdata =Provider.of<CartModel>(context).productData;
    Data product = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.yellow[100],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.deepOrange[800],
            size: 25,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModalHud>(context).isloading,
        child: Form(
          key: _globalkey,
          child: ListView(
            children: [
              Container(
                height: heightScreen * 0.7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Coustom_Text_Faild(
                      OnSaved: (value) {
                        widget.name = value;
                      },
                      hintText: "enter your name".tr,
                      iconData: Icons.person,
                    ),
                    Coustom_Text_Faild(
                      OnSaved: (value) {
                        widget.phone = value;
                      },
                      hintText: "enter your phone".tr,
                      iconData: Icons.phone,
                      keyboardType: TextInputType.phone,
                    ),
                    Coustom_Text_Faild(
                      OnSaved: (value) {
                        widget.whats = value;
                      },
                      keyboardType: TextInputType.phone,
                      hintText: "enter your phone whats app".tr,
                      iconData: Icons.phone_android,
                    ),
                    Coustom_Text_Faild(
                      OnSaved: (value) {
                        widget.address = value;
                      },
                      hintText: "enter your address".tr,
                      iconData: Icons.home_outlined,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Builder(
                  builder: (context) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Container(
                      height: heightScreen * 0.1,
                      child: AnimatedButton(
                        text: "send order".tr,
                        color: Colors.yellow[900],
                        pressEvent: () {
                          AwesomeDialog(
                            context: context,
                            btnOkText: "send".tr,
                            btnCancelText: "sure you naw".tr,
                            width: widthScreen * 0.8,
                            buttonsBorderRadius:
                                BorderRadius.all(Radius.circular(2)),
                            headerAnimationLoop: false,
                            animType: AnimType.BOTTOMSLIDE,
                            title: 'send order',
                            desc: 'You will be contacted within a day'.tr,
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                              try {
                                if (_globalkey.currentState.validate()) {
                                  _globalkey.currentState.save();
                                  var load = Provider.of<ModalHud>(context,
                                      listen: false);
                                  load.ChangeLoading(true);
                                  widget._store.UpDtatOrder(InfoOrder(
                                      type: product.brandName,
                                      size: product.size,
                                      image: product.images[0].images,
                                      nameProduct: product.modelName,
                                      address: widget.address,
                                      nameUser: widget.name,
                                      phone: widget.phone,
                                      whats: widget.whats));
                                  _globalkey.currentState.reset();
                                  load.ChangeLoading(false);
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text("success to send order".tr),
                                    elevation: 2.0,
                                    backgroundColor: Colors.deepOrange[900],
                                  ));
                                }
                              } catch (ex) {
                                print(ex.toString());
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text(ex.toString())));
                              }
                            },
                          )..show();
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
