#!/usr/bin/env sh

#
# Copyright 2015 the original author or authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS=""

APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`

# Use the maximum available, or set MAX_FD != -1 to use that value.
MAX_FD="maximum"

warn () {
    echo "$*"
}

die () {
    echo
    echo "ERROR: $*"
    echo
    exit 1
}

# OS specific support (must be 'true' or 'false').
cygwin=false
msys=false
darwin=false
nonstop=false
case "`uname`" in
  CYGWIN* )
    cygwin=true
    ;;
  Darwin* )
    darwin=true
    ;;
  MINGW* )
    msys=true
    ;;
  NONSTOP* )
    nonstop=true
    ;;
esac

CLASSPATH_SEPARATOR=:
if $cygwin || $msys; then
  CLASSPATH_SEPARATOR=';'
fi

# Attempt to set APP_HOME
# Resolve links: $0 may be a link
PRG="$0"
# Need this for relative symlinks.
while [ -h "$PRG" ] ; do
    ls=`ls -ld "$PRG"`
    link=`expr "$ls" : '.*-> \(.*\)$'`
    if expr "$link" : '/.*' > /dev/null; then
        PRG="$link"
    else
        PRG=`dirname "$PRG"`"/$link"
    fi
done

APP_HOME=`dirname "$PRG"`
APP_HOME=`cd "$APP_HOME" && pwd`

# Check for gradlew properties
if [ -f "$APP_HOME/gradle/wrapper/gradle-wrapper.properties" ]; then
    . "$APP_HOME/gradle/wrapper/gradle-wrapper.properties"
else
    die "Could not locate Gradle wrapper properties file."
fi

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS=""

# Check for gradlew properties
if [ -f "$APP_HOME/gradle/wrapper/gradle-wrapper.properties" ]; then
    . "$APP_HOME/gradle/wrapper/gradle-wrapper.properties"
else
    die "Could not locate Gradle wrapper properties file."
fi

# For Cygwin, switch paths to Windows format before running java
if $cygwin ; then
    APP_HOME=`cygpath --path --mixed "$APP_HOME"`
    CLASSPATH=`cygpath --path --mixed "$CLASSPATH"`
    JAVACMD=`cygpath --unix "$JAVACMD"`
    # We build the pattern for arguments to be converted to Windows paths
    ROOTDIRSRAW=`find -L / -maxdepth 1 -mindepth 1 -type d 2>/dev/null`
    SEP=""
    for dir in $ROOTDIRSRAW ; do
        ROOTDIRS="$ROOTDIRS$SEP$dir"
        SEP="|"
    done
    WIN_ROOTDIRS=`cygpath -w "$ROOTDIRS"`
    FEATURES=`echo "$FEATURES" | sed 's/\"/\\\\\"/g'`
fi

# Escape application name
APP_NAME_ESCAPED=`echo "$APP_NAME" | sed 's/ /\\\\ /g'`

# Execute Gradle
exec "$JAVACMD" \
    "${DEFAULT_JVM_OPTS[@]}" \
    "${JAVA_OPTS[@]}" \
    "${GRADLE_OPTS[@]}" \
    "-Dorg.gradle.appname=$APP_NAME_ESCAPED" \
    -classpath "$CLASSPATH" \
    org.gradle.wrapper.GradleWrapperMain "$@"
