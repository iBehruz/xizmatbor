import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class LocationPickerPage extends StatefulWidget {
  static String routeName = '/location_picker';
  const LocationPickerPage({super.key});

  @override
  State<LocationPickerPage> createState() => _LocationPickerPageState();
}

class _LocationPickerPageState extends State<LocationPickerPage> {
  late YandexMapController mapController;
  final TextEditingController searchController = TextEditingController();
  final List<MapObject> mapObjects = [];

  // Tashkent coordinates
  static const Point _initialPoint = Point(
    latitude: 41.2995,
    longitude: 69.2401,
  );

  @override
  void initState() {
    super.initState();
    searchController.text = "";
    _createPlacemarks();

  }

  void _createPlacemarks() {

    final location_up = PlacemarkIcon.single(
      PlacemarkIconStyle(
        image: BitmapDescriptor.fromAssetImage('assets/icons/location_up.png'),
        scale: 1,
      ),
    );

    final location_down = PlacemarkIcon.single(
      PlacemarkIconStyle(
        image: BitmapDescriptor.fromAssetImage('assets/icons/location_down.png'),
        scale: 1,
      ),
    );

    mapObjects.addAll([

      PlacemarkMapObject(
          mapId: const MapObjectId("custom-location"),
          point: const Point(latitude: 41.2995, longitude: 69.2401),
          onTap: (PlacemarkMapObject self, Point point) => print('Tapped me at $point'),
          opacity: 0.7,
          direction: 90,
          isDraggable: true,
          onDragStart: (_) => print('Drag start'),
          onDrag: (_, Point point) => print('Drag at point $point'),
          onDragEnd: (_) => print('Drag end'),
          icon: location_down,
          text: const PlacemarkText(
              text: 'o',
              style: PlacemarkTextStyle(
                  placement: TextStylePlacement.top,
                  color: Colors.amber,
                  outlineColor: Colors.black
              )
          )
      ),


    ]);
  }

  void _onMapCreated(YandexMapController controller) {
    mapController = controller;
    _goToMyLocation();
  }

  Future<void> _zoomIn() async {
    await mapController.moveCamera(
      CameraUpdate.zoomIn(),
      animation: const MapAnimation(
        type: MapAnimationType.smooth,
        duration: 0.3,
      ),
    );
  }

  Future<void> _zoomOut() async {
    await mapController.moveCamera(
      CameraUpdate.zoomOut(),
      animation: const MapAnimation(
        type: MapAnimationType.smooth,
        duration: 0.3,
      ),
    );
  }

  Future<void> _goToMyLocation() async {
    await mapController.moveCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(target: _initialPoint, zoom: 15.0),
      ),
      animation: const MapAnimation(
        type: MapAnimationType.smooth,
        duration: 0.5,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Yandex Map
          YandexMap(
            onMapCreated: _onMapCreated,
            mapObjects: mapObjects,
            nightModeEnabled: false,
            zoomGesturesEnabled: true,
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            tiltGesturesEnabled: true,

            onCameraPositionChanged: (cameraPosition, reason, finished) {
              setState(() {
                // mapObjects[mapObjects.indexOf(mapObjects[0])] =
                mapObjects.clear();
                    mapObjects.add(PlacemarkMapObject(
                        mapId: const MapObjectId("custom-location"),
                        point: Point(latitude: cameraPosition.target.latitude, longitude: cameraPosition.target.longitude),
                        onTap: (PlacemarkMapObject self, Point point) => print('Tapped me at $point'),
                        opacity: 0.7,
                        direction: 90,
                        isDraggable: true,
                        onDragStart: (_) => print('Drag start'),
                        onDrag: (_, Point point) => print('Drag at point $point'),
                        onDragEnd: (_) => print('Drag end'),
                        icon: PlacemarkIcon.single(
                          PlacemarkIconStyle(
                            image: BitmapDescriptor.fromAssetImage('assets/icons/location_down.png'),
                            scale: 1,
                          ),
                        ),
                        text: const PlacemarkText(
                            text: 'o',
                            style: PlacemarkTextStyle(
                                placement: TextStylePlacement.top
                            )
                        )
                    ));


                    // .copyWith(
                    // point: Point(
                    //     latitude: mapObject.point.latitude - 1,
                    //     longitude: mapObject.point.longitude - 1
                    // )

              });
            },
          ),

          // Top bar with back button and title
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 8,
                left: 16,
                right: 16,
                bottom: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.white70,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 20),
                    onPressed: () => Navigator.maybePop(context),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Ваше местоположение',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom container with search and button
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: MediaQuery.of(context).padding.bottom + 16,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Search field
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: 'Поиск адреса',
                        prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                      onSubmitted: (value) {
                        // Handle search - you can implement geocoding here
                      },
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Save button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle save location
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Сохранено: ${searchController.text}',
                            ),
                            backgroundColor: Colors.blueGrey,
                            behavior: SnackBarBehavior.floating,
                            margin: const EdgeInsets.all(16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Сохранить',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Zoom controls
          Positioned(
            right: 16,
            bottom: 200,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.add, size: 20),
                    onPressed: _zoomIn,
                    tooltip: 'Приблизить',
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.remove, size: 20),
                    onPressed: _zoomOut,
                    tooltip: 'Отдалить',
                  ),
                ),
              ],
            ),
          ),

          // Location button
          Positioned(
            right: 16,
            bottom: 300,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: IconButton(
                icon: const Icon(Icons.my_location, size: 20),
                onPressed: _goToMyLocation,
                tooltip: 'Моё местоположение',
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
