plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services") // by me
    
   
}


android {
    namespace = "com.example.heavyfreighttest"
    compileSdk = flutter.compileSdkVersion
     // Set the NDK version to 27.0.12077973 as required by fluttertoast
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.heavyfreighttest"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

dependencies {
    // Import Firebase BoM for version management
    implementation(platform("com.google.firebase:firebase-bom:33.14.0"))

    // Add Firebase Analytics dependency (example)
    implementation("com.google.firebase:firebase-analytics")

    // Add any other Firebase dependencies you need here, e.g.
    // implementation("com.google.firebase:firebase-messaging")
}


flutter {
    source = "../.."
}
