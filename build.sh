#!/usr/bin/env bash

ext_path=$(pwd)
ext_name="g5_othercode"
version="1.1.3"

echo "**********************"
echo "Building: ${ext_name}"
echo "Version: ${version}"
echo "**********************"
echo "Path: ${ext_path}"
echo "**********************"

echo "Cleaning..."
cd "${ext_path}" || exit
rm -rf "${ext_path}"/_builds "${ext_path}"/_builds/"${ext_name}"
mkdir -p "${ext_path}"/_builds "${ext_path}"/_builds/"${ext_name}"

echo "Building directories..."
for directory in $(find ./ -type d | grep -vE ".git|.idea|custom|_build" | sed 's/.\///'); do
  if [ -n "${directory}" ]; then
    mkdir -p "${ext_path}"/_builds/"${ext_name}"/"${directory}"
  fi
done

echo "Copying files..."
for file in $(find ./ -type f | grep -vE ".git|.idea|custom|.sh$|_build|LICENSE|.md$"); do
  cp -r "${file}" "${ext_path}"/_builds/$ext_name/"${file}"
done

perl -pi -e 's/VERSION/'$version'/g;s/DATE/'"$(date +%Y-%m-%d)"'/g' "${ext_path}"/_builds/$ext_name/templateDetails.xml
perl -pi -e 's/VERSION/'$version'/g;s/DATE/'"$(date +%Y-%m-%d)"'/g' "${ext_path}"/_builds/$ext_name/gantry/theme.yaml

echo "Building zip package..."
cd "${ext_path}"/_builds || exit
zip -rq "${ext_path}"/_builds/"${ext_name}".zip "${ext_name}"
rm -rf "${ext_path}"/_builds/"${ext_name}"

echo "Done!"
