#!/bin/bash

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
STAGING_BASE_URL=($2)

if [ $CURR = $STAGING_BASE_URL ]; then
    echo "Change base url for production"
    echo ""
    sedi "s/^BASE_URL.*//" ./.env
    echo "BASE_URL=$PROD_BASE_URL" >>./.env
    echo "let's build"
else
    echo "let's build"
fi
