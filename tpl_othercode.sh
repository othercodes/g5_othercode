#!/bin/bash

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

echo "Copiyng files..."
for file in $TEMPLATE/*
do
    if [ "$file" = "$TEMPLATE/builds" ] || [ "$file" = "$TEMPLATE/.idea/" ] || [ "$file" = "$TEMPLATE/.git" ] || [ "$file" = "$TEMPLATE/custom" ] || [ "$file" = "$TEMPLATE/tpl_othercode.sh" ]; then
        continue;
    fi
    cp -r "$file" $TEMPLATE"/builds/src/"
done

perl -pi -e 's/VERSION/'$VERSION'/g;s/DATE/'$DATE'/g' $TEMPLATE/builds/src/templateDetails.xml
perl -pi -e 's/VERSION/'$VERSION'/g;s/DATE/'$DATE'/g' $TEMPLATE/builds/src/gantry/theme.yaml

echo "Building zip package..."
cd $TEMPLATE/builds/src && zip -rq $TEMPLATE/builds/$EXTENSION.zip ./

echo "Done!"
