#!/bin/bash
# push on current branch

BASE_PATH=android/app/build/outputs/apk/release
BUNDLE_PATH=android/app/build/outputs/bundle/release
BITBUCKET_USERNAME=($1)
BITBUCKET_APP_PASSWORD=($2)
BITBUCKET_REPO_OWNER=($3)
BITBUCKET_REPO_SLUG=($4)
today=$(date +%m-%d-%Y)

mv "$BASE_PATH/app-release.apk" "$BASE_PATH/app-release-$today.apk"
mv "$BUNDLE_PATH/app.aab" "$BUNDLE_PATH/app-bundle-$today.aab"

APP_NAME=app-release-$today.apk
BUNDLE_NAME=app-bundle-$today.aab
echo "$APP_NAME"
echo "$BUNDLE_NAME"

curl -X POST "https://${BITBUCKET_USERNAME}:${BITBUCKET_APP_PASSWORD}@api.bitbucket.org/2.0/repositories/${BITBUCKET_REPO_OWNER}/${BITBUCKET_REPO_SLUG}/downloads" --form files=@"$BASE_PATH/$APP_NAME"
curl -X POST "https://${BITBUCKET_USERNAME}:${BITBUCKET_APP_PASSWORD}@api.bitbucket.org/2.0/repositories/${BITBUCKET_REPO_OWNER}/${BITBUCKET_REPO_SLUG}/downloads" --form files=@"$BUNDLE_PATH/$BUNDLE_NAME"

echo ""

ls -la

exit 0
