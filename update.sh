#!/bin/sh

MAKEFILES=$(find . -name Makefile -depth 3)
IFS=$'\n'
for MAKEFILE in $MAKEFILES; do
  OLD_DISTVERSION=$(cat "${MAKEFILE}" | grep '^DISTVERSION=[[:space:]]*g' | cut -d "=" -f 2 | xargs | cut -d ":" -f 1)
  OLD_GH_TAGNAME=$(cat "${MAKEFILE}" | grep '^GH_TAGNAME=' | cut -d "=" -f 2 | xargs | cut -d ":" -f 1)
  GH_ACCOUNT=$(cat "${MAKEFILE}" | grep '^GH_ACCOUNT=' | cut -d "=" -f 2 | xargs | cut -d ":" -f 1)
  GH_PROJECT=$(cat "${MAKEFILE}" | grep '^GH_PROJECT=' | cut -d "=" -f 2 | xargs | cut -d ":" -f 1)

  if [ -z "${OLD_DISTVERSION}" ] || [ -z "${OLD_GH_TAGNAME}" ] || [ -z  "${GH_ACCOUNT}" ] ||  [ -z  "${GH_PROJECT}" ] ; then
    continue
  fi
  echo "${MAKEFILE}" "${OLD_DISTVERSION}" "${OLD_GH_TAGNAME}" "${GH_ACCOUNT}/${GH_PROJECT}"
  NEW_GH_TAGNAME=$(git ls-remote "https://github.com/${GH_ACCOUNT}/${GH_PROJECT}" | grep "HEAD$" | head -c 7)
  NEW_DISTVERSION=g$(curl "https://api.github.com/repos/${GH_ACCOUNT}/${GH_PROJECT}/commits/${NEW_GH_TAGNAME}" | grep '"date"' | head -n 1 | cut -d '"' -f 4 | cut -d "T" -f 1 | sed -e 's|-||g')
  if [ -z "${NEW_DISTVERSION}" ] || [ -z "${NEW_GH_TAGNAME}" ] ; then
    continue
  fi
  echo "--> ${NEW_DISTVERSION} ${NEW_GH_TAGNAME}"
  sed -i '' -e "s|${OLD_DISTVERSION}|${NEW_DISTVERSION}|g" "${MAKEFILE}"
  sed -i '' -e "s|${OLD_GH_TAGNAME}|${NEW_GH_TAGNAME}|g" "${MAKEFILE}"
  ( cd $(dirname "${MAKEFILE}") && make makesum )
done
