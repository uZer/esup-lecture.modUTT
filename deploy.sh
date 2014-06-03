#!/bin/sh
# Deploy esup-lecture files

#########
## ENV ##
#########

# Compilation folder of uPortal (must contain a "custom" directory)
# Default: /home/esup/BUILD/esup-uPortal-3.2.4-esup-1.0.0-RC3
EDIT_BASE="/home/esup/BUILD/esup-uPortal-3.2.4-esup-1.0.0-RC3"

# Esup-Lecture Subfolder
EDIT_LECTURE="$EDIT_BASE/custom/esup-lecture-portlet"

# UTT and uPortal Skins
EDIT_THEME="$EDIT_BASE/custom/uPortal/uportal-war/src/main/webapp/media/skins"

# Localisation of this bundle
SOURCE=`dirname $0`


############
## DEPLOY ##
############

# CSS / IMG
for i in anis blue pink violet; do
    echo "Preparing skin colors: $i"
    mkdir -p $EDIT_THEME/universality/skin-utt-$i/
    rm $EDIT_THEME/universality/skin-utt-$i/lecture.css 2>/dev/null
    rm $EDIT_THEME/universality/skin-utt-$i/images/headerbg.$i.png 2>/dev/null
    cp $SOURCE/css/lecture.$i.css $EDIT_THEME/universality/skin-utt-$i/lecture.css
    cp $SOURCE/img/headerbg.$i.png $EDIT_THEME/universality/skin-utt-$i/images/headerbg.$i.png
done


# XML
for i in android iphone; do
    echo "Preparing skin (mobile version): $i"
    mkdir -p $EDIT_THEME/muniversality/$i/
    rm $EDIT_THEME/muniversality/$i/skin.xml 2>/dev/null
    cp $SOURCE/xml/skin.$i.xml $EDIT_THEME/muniversality/$i/skin.xml
done


# JS
echo "Preparing javascript"
mkdir -p $EDIT_THEME/universality/common/javascript/uportal/
rm $EDIT_THEME/universality/common/javascript/uportal/esup-lecture.js 2>/dev/null
cp $SOURCE/js/esup-lecture.js $EDIT_THEME/universality/common/javascript/uportal/esup-lecture.js


# JSPX
for i in `ls -1 $SOURCE/jspx/desktop`; do
    echo "Preparing templates: $i"
    mkdir -p $EDIT_LECTURE/stylesheets/
    rm $EDIT_LECTURE/stylesheets/$i 2>/dev/null
    cp $SOURCE/jspx/desktop/$i $EDIT_LECTURE/stylesheets/$i
done


# JSPX mobile
for i in `ls -1 $SOURCE/jspx/mobile`; do
    echo "Preparing mobile templates: $i"
    mkdir -p $EDIT_LECTURE/stylesheets/mobile/
    rm $EDIT_LECTURE/stylesheets/mobile/$i 2>/dev/null
    cp $SOURCE/jspx/mobile/$i $EDIT_LECTURE/stylesheets/mobile/$i
done


# XSL
for i in rss-jquery-inline; do
    echo "Preparing templates: RSS"
    mkdir -p $EDIT_LECTURE/WEB-INF/classes/properties/examples/xsl/
    rm $EDIT_LECTURE/WEB-INF/classes/properties/examples/xsl/$i.xsl 2>/dev/null
    cp $SOURCE/xsl/$i.xsl $EDIT_LECTURE/WEB-INF/classes/properties/examples/xsl/$i.xsl
done

exit 0
