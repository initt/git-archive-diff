#!/bin/sh

REPO=$(echo $1 | sed -e "s#^#/#g" -e "s#:##g")
NEW_SHA=$2
OLD_SHA=$3

if [ "$OLD_SHA" == "" ];then
	OLD_SHA="$NEW_SHA~1"
	ARCHIVE="C:\Users\\$USERNAME\Desktop\\$(echo $NEW_SHA | cut -c-7).zip"
else
	ARCHIVE="C:\Users\\$USERNAME\Desktop\\$(echo $OLD_SHA | cut -c-7)-$(echo $NEW_SHA | cut -c-7).zip"
fi

cd $REPO
git diff --name-only --diff-filter=AMCR $OLD_SHA..$NEW_SHA | sed -e "s/ /\\\ /g"
git diff --name-only --diff-filter=AMCR $OLD_SHA..$NEW_SHA | sed -e "s/ /\\\ /g" | xargs git archive --format=zip $NEW_SHA -o $ARCHIVE --prefix=$(basename $REPO)/

