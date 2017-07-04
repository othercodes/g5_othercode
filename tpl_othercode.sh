#!/usr/bin/env bash

TEMPLATE=`pwd`

EXTENSION="g5_othercode"
VERSION="1.0-"`date +%s`
DATE="`date +%Y-%m-%d`"

echo "**********************"
echo "Building: "$EXTENSION
echo "Version: "$VERSION
echo "**********************"
echo "Builder:" $TEMPLATE
echo "**********************"

echo "Cleaning..."
cd $TEMPLATE

rm -rf $TEMPLATE/builds
mkdir -p $TEMPLATE/builds/src

for file in $TEMPLATE/*
do
    [[ $file = $TEMPLATE/builds || $file = $TEMPLATE/.idea/ || $file = $TEMPLATE/.git || $file = $TEMPLATE/tpl_othercode.sh ]] && continue
    cp -r "$file" $TEMPLATE"/builds/src/"
done

perl -pi -e 's/VERSION/'$VERSION'/g;s/DATE/'$DATE'/g' $TEMPLATE/builds/src/templateDetails.xml
perl -pi -e 's/VERSION/'$VERSION'/g;s/DATE/'$DATE'/g' $TEMPLATE/builds/src/gantry/theme.yaml

echo "Building zip package..."
cd $TEMPLATE/builds/src && zip -r $TEMPLATE/builds/$EXTENSION.zip ./

echo "Done!"
