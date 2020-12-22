import 'package:flutter/cupertino.dart';
import 'package:nadiiasky_flutter_app/entity/postslist.dart';
import 'package:nadiiasky_flutter_app/model/AppModel.dart';
import 'package:provider/provider.dart';

class MyConsumer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppModel>(builder: (context, model, child) {
      if (model.isMainPage || model.page == null) {
        return PostsList();
      } else {
        return model.page;
      }
    });
  }
}
