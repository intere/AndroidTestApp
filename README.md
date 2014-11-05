# AndroidTestApp
The purpose of this app is to determine the path from starting an initial (gradle-based) android app and moving it over to use maven.


## Tag definitions
* ``step_1`` - This is the initial commit (fresh android project, created via the Android Studio), still using gradle.
* ``step_2`` - This is my first stab at getting this to build with maven.  I'm pretty close (I think), but I'm getting some issues that have to do with code generation.
* ``step_3`` - I finally figured it out (building with maven).  There are some ugly caveats associated with it though (see the troubleshooting area).
* ``step_4`` - I figured out how to allow both gradle and maven to co-exist.  Essentially I've just added an exclusion to one of the sets of resources.

## Building
To build the project, do the following:
```bash
mvn clean install
#...
#... lots of output, followed by:
#...
[INFO] ------------------------------------------------------------------------
[INFO] Reactor Summary:
[INFO]
[INFO] android-test ....................................... SUCCESS [  7.671 s]
[INFO] android-test-parent ................................ SUCCESS [  0.099 s]
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time: 8.769 s
[INFO] Finished at: 2014-11-05T05:36:31-07:00
[INFO] Final Memory: 24M/210M
[INFO] ------------------------------------------------------------------------
```
Does it not work for you?  See the [``Troubleshooting``](#troubleshooting) section.

## Referenced Links
* [Google Code: androidManifest is ignored](https://code.google.com/p/maven-android-plugin/issues/detail?id=61)
* [StackOverflow: DEX fails parsing a jar including BuildConfig and R using Gradle, but worked with Ant](http://stackoverflow.com/questions/19934681/dex-fails-parsing-a-jar-including-buildconfig-and-r-using-gradle-but-worked-wit)

## Tools
Since I can't seem to find the Maven Support Jars anywhere, I've authored a script to install them on your behalf.  Just make sure you define your ``ANDROID_HOME`` environment variable to resolve to the base of your Android SDK.
```bash
./install-jars.sh
installed android-support-v13:
<dependency>
  <groupId>com.google.android</groupId>
  <artifactId>android-support-v13</artifactId>
  <version>1.0.0</version>
</dependency>
```

<a name="troubleshooting"></a>
## Troubleshooting
Are you running ``mvn clean install`` and seeing errors like this?
```
[INFO] UNEXPECTED TOP-LEVEL EXCEPTION:
[INFO] java.lang.IllegalArgumentException: already added: Landroid/support/v4/app/RemoteInputCompatBase;
```
You will need to nuke the ``app/build`` folder before you build:
```bash
rm -rf app/build
```

Trying to run ``mvn clean install`` and seeing output like this?
```bash
[ERROR] Failed to execute goal com.jayway.maven.plugins.android.generation2:android-maven-plugin:3.8.2:generate-sources (default-generate-sources) on project android-test: The plugin com.jayway.maven.plugins.android.generation2:android-maven-plugin:3.8.2 requires Maven version 3.1.1 -> [Help 1]
```
You will need maven 3.1.1 at a minimum (requirement of the android-maven-plugin):

Having issues running the install-jars.sh script?
If you do not set your ``ANDROID_HOME`` environment variable, the output will look like this:
```bash
./install-jars.sh
Error: You didn't set the ANDROID_HOME Environment Variable
```
Set your ``ANDROID_HOME`` environment variable and try again.
