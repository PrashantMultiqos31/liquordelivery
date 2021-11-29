import 'dart:async';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:liquordelivery/common/customappbar.dart';
import 'package:liquordelivery/common/myseparator.dart';
import 'package:liquordelivery/constant/app_assets.dart';
import 'package:liquordelivery/constant/color_constant.dart';
import 'package:liquordelivery/constant/font_style.dart';
import 'package:url_launcher/url_launcher.dart';

class GoogleMApDelivery extends StatefulWidget {
  const GoogleMApDelivery({Key? key}) : super(key: key);

  @override
  _GoogleMApDeliveryState createState() => _GoogleMApDeliveryState();
}

class _GoogleMApDeliveryState extends State<GoogleMApDelivery> {
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

  GoogleMapController? controller;
  BitmapDescriptor? myIcon;

  List<LatLng> latLngSegment1 = <LatLng>[];

  static const LatLng _lat1 = LatLng(22.6406, 72.1949);
  static const LatLng _lat2 = LatLng(22.5663, 72.2001);

  //set list and marker point
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  final LatLng _lastMapPosition = _lat1;

  @override
  void initState() {
    super.initState();
    latLngSegment1.add(_lat1);
    latLngSegment1.add(_lat2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - 230,
            // create google map
            child: GoogleMap(
              polylines: _polyline,
              markers: _markers,
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _lastMapPosition,
                zoom: 11.5,
              ),
              mapType: MapType.normal,
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Wrap(
              children: [_bottomSheetView()],
            ),
          ),
        ],
      ),
    );
  }

  //add marker lights
  void _onMapCreated(GoogleMapController controllerParam) async {
    final Uint8List markerIcon =
        await _getBytesFromAsset(AssetImages.home, 150);
    final Uint8List markerIcon1 =
        await _getBytesFromAsset(AssetImages.bike, 150);

    controller = controllerParam;
    _markers.add(Marker(
      icon: BitmapDescriptor.fromBytes(markerIcon),
      markerId: MarkerId(_lastMapPosition.toString()),
      position: _lastMapPosition,
    ));

    _markers.add(Marker(
      icon: BitmapDescriptor.fromBytes(markerIcon1),
      markerId: MarkerId(_lat2.toString()),
      position: _lat2,
    ));

    _polyline.add(Polyline(
      polylineId: const PolylineId('line1'),
      visible: true,
      points: latLngSegment1,
      width: 5,
      color: Colors.red,
    ));
    setState(() {});
  }

//google map bottom sheet
  Widget _bottomSheetView() {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Card(
        elevation: 25,
        margin: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
        color: Theme.of(context).cardColor,
        shadowColor: AppColors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: SizedBox(
          height: 230,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(AssetImages.person),
                        backgroundColor: AppColors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Alex JohnSons',
                              style: AppFontStyle.smallSizeFont.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .color,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: AppColors.lightYellow,
                                  size: 12,
                                ),
                                Text(
                                  '4.5',
                                  style: AppFontStyle.smallSizeFont.copyWith(
                                    color: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .color,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.lightYellow,
                            border: Border.all(
                              color: AppColors.lightYellow,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.messenger,
                            size: 25,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            border: Border.all(
                              color: AppColors.green,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _makePhoneCall('tel:9974177799');
                            },
                            child: const Icon(
                              Icons.call,
                              size: 25,
                            ),
                          ))
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).canvasColor,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, right: 8, top: 8),
                                child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: AppColors.green,
                                      border: Border.all(
                                        color: AppColors.green,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: const Icon(
                                      Icons.shopping_bag,
                                      size: 25,
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Liquor Store, WashingTons',
                                    style: AppFontStyle.smallSizeFont.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                    ),
                                  ),
                                  Text(
                                    'Bar',
                                    style: AppFontStyle.smallSizeFont.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 22.0, top: 3, bottom: 3),
                            child: Container(
                              alignment: Alignment.bottomLeft,
                              height: 35,
                              child: MySeparator(
                                directions: Axis.vertical,
                                height: 0.1,
                                color: AppColors.green,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: AppColors.green,
                                      border: Border.all(
                                        color: AppColors.green,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: const Icon(
                                      Icons.location_on,
                                      size: 25,
                                    )),
                              ),
                              const SizedBox(
                                height: 20,
                                width: 15,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '192 Street, WashingTons Dc-382515',
                                    style: AppFontStyle.smallSizeFont.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                    ),
                                  ),
                                  Text(
                                    'Home',
                                    style: AppFontStyle.smallSizeFont.copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      decoration: const BoxDecoration(),
    );
  }

//add call to open device phone
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

// convert for size of images
  Future<Uint8List> _getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
