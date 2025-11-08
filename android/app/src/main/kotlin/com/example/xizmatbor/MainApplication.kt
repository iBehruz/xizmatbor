package com.example.xizmatbor

import io.flutter.app.FlutterApplication
import com.yandex.mapkit.MapKitFactory

class MainApplication : FlutterApplication() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setApiKey("2ea9551c-32ad-465b-bc35-0c95bf9d0e1e") // Replace with your key
    }
}