# AndroidTestApp
The purpose of this app is to determine the path from starting an initial (gradle-based) android app and moving it over to use maven.


Tag definitions:
* ``step_1`` - This is the initial commit (fresh android project, created via the Android Studio), still using gradle.
* ``step_2`` - This is my first stab at getting this to build with maven.  I'm pretty close (I think), but I'm getting some issues that have to do with code generation.

## Referenced Links
* [Google Code: androidManifest is ignored](https://code.google.com/p/maven-android-plugin/issues/detail?id=61)
* [StackOverflow: DEX fails parsing a jar including BuildConfig and R using Gradle, but worked with Ant](http://stackoverflow.com/questions/19934681/dex-fails-parsing-a-jar-including-buildconfig-and-r-using-gradle-but-worked-wit)

## Tools
Since I can't seem to find the Maven Support Jars anywhere, I've authored a script to install them on your behalf.  Just make sure you define your ``ANDROID_HOME`` environment variable to resolve to the base of your Android SDK.
*


## Troubleshooting
Note, you will need maven 3.1.1 at a minimum (requirement of the android-maven-plugin):
```bash
[ERROR] Failed to execute goal com.jayway.maven.plugins.android.generation2:android-maven-plugin:3.8.2:generate-sources (default-generate-sources) on project android-test: The plugin com.jayway.maven.plugins.android.generation2:android-maven-plugin:3.8.2 requires Maven version 3.1.1 -> [Help 1]
```
