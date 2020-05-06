# e.g. jvm 1.8
function j() {
    if [ $# -ne 0 ]; then
        local ver=$1
        removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
        if [ -n "${JAVA_HOME+x}" ]; then
        removeFromPath $JAVA_HOME
        fi
        export JAVA_HOME=$(/usr/libexec/java_home -v $ver)
        export PATH=$JAVA_HOME/bin:$PATH

        java -version
        echo "JAVA_HOME $JAVA_HOME";
    else
        echo "Usage: jvm <version>"
    fi
}
