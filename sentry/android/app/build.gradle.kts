plugins {
    id("com.android.application")
    id("kotlin-android")

     // Add the Google services Gradle plugin
    id("com.google.gms.google-services")


    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.sentry"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.sentry"
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

flutter {
    source = "../.."
}

dependencies {
    // Import Firebase BoM to manage Firebase versions automatically
    implementation(platform("com.google.firebase:firebase-bom:33.12.0"))

    // Firebase SDKs (add any Firebase product you want to use)
    implementation("com.google.firebase:firebase-auth")  // Example: Firebase Authentication
    implementation("com.google.firebase:firebase-firestore")  // Example: Firestore

    // Add other Firebase dependencies as needed
    // Note: Do NOT specify version numbers for Firebase libraries when using BoM
}