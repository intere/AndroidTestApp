#!/bin/bash

if [ "${ANDROID_HOME}" == "" ] ; then
  echo "Error: You didn't set the ANDROID_HOME Environment Variable";
  exit 1;
fi

SUPPORT_V13_JAR="${ANDROID_HOME}/extras/android/support/v13/android-support-v13.jar";
if [ -e "${SUPPORT_V13_JAR}" ]; then
  mvn install:install-file -Dfile="${SUPPORT_V13_JAR}" \
    -DgroupId=com.google.android \
    -DartifactId=android-support-v13 \
    -Dversion=1.0.0 \
    -Dpackaging=jar

  echo "installed android-support-v13: "
  echo '<dependency>'
  echo '  <groupId>com.google.android</groupId>'
  echo '  <artifactId>android-support-v13</artifactId>'
  echo '  <version>1.0.0</version>'
  echo '</dependency>'
fi
