#!/bin/bash
# push on current branch

function sedi() {
    if [ "$(uname)" == "Linux" ]; then
        sed -i "$@"
    else
        sed -i "" "$@"
    fi
}

CURR="$(grep "BASE*" .env)"
CURR=${CURR#*=}
echo $CURR
PROD_BASE_URL=($1)
MYAPP_RELEASE_STORE_FILE=($2)
MYAPP_RELEASE_KEY_ALIAS=($3)
MYAPP_RELEASE_KEY_PASSWORD=($4)
MYAPP_RELEASE_STORE_PASSWORD=($5)

function checkKeyStoreValue() {
    MYAPP_RELEASE_STORE_PASSWORD="$(grep "MYAPP_RELEASE_STORE_PASSWORD" gradle.properties)"
    echo $MYAPP_RELEASE_STORE_PASSWORD
    if [ -z "$MYAPP_RELEASE_STORE_PASSWORD" ]; then
        echo "you haven't set STORE_PASSWORD"
        echo "im setting the file"
        echo "MYAPP_RELEASE_STORE_PASSWORD=$MYAPP_RELEASE_KEY_PASSWORD" >>gradle.properties
        echo "MYAPP_RELEASE_KEY_PASSWORD=$MYAPP_RELEASE_KEY_PASSWORD" >>gradle.properties
        echo "MYAPP_RELEASE_STORE_FILE=$MYAPP_RELEASE_STORE_FILE" >>gradle.properties
        echo "MYAPP_RELEASE_KEY_ALIAS=$MYAPP_RELEASE_KEY_ALIAS" >>gradle.properties
    else
        echo "don't forget the version number"
        echo "check version number"
    fi
}

function increaseVersionCode() {
    currentVersionCode=$(grep "versionCode " build.gradle | awk '{print $2}')
    echo "Current versionCode is: $currentVersionCode"
    for entry in $(awk '/versionCode / {print $2}' ./build.gradle); do
        index=$(echo ${entry})
        sedi 's/versionCode [0-9a-zA-Z -_]*/versionCode '$(($index + 1))'/' ./build.gradle
    done

    echo "New versionCode is: $(grep "versionCode " build.gradle | awk '{print $2}')"
}

if [ $CURR = $PROD_BASE_URL ]; then
    echo ok
    cd "android"
    checkKeyStoreValue
    cd "app"
    increaseVersionCode
    cd ..
    echo "let's build"

else
    echo $CURR
    echo "Change base url for production"
    echo ""
    sed -i "s/^BASE_URL.*//" ./.env
    echo "BASE_URL=$PROD_BASE_URL" >>./.env
    cd "android"
    checkKeyStoreValue
    cd "app"
    increaseVersionCode
    cd ..
    echo "let's build"

fi

exit 0
