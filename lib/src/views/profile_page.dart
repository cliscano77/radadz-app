import 'package:flutter/material.dart';
import 'package:radadz_app/src/slider/navigation.dart';
import 'package:radadz_app/src/utils/export.dart';

class ProfilePage extends StatefulWidget with NavigationStates {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final prefs = new Preferences();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ListDriverBloc>().getDriver(driver_id: prefs.getDriverId);
  }

  @override
  Widget build(BuildContext context) {
    final listDriverProvider = context.watch<ListDriverBloc>();

    return listDriverProvider.isLoading
        ? ActivityIndicator(marginTop: 50)
        : Scaffold(
            key: _scaffoldKey,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(65.h),
              child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  flexibleSpace : ToolbarTitleCustom(title: 'profile_title'.tr())
              ),
            ),
            backgroundColor: Colors.white,
            body: ProfileDriver(driver: listDriverProvider.selectDriver,));
  }
}
