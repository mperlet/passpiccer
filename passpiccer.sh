echo "PassPiccer V0.1"
echo "Info: 15x10cm Foto @ 300dpi "
echo "Generate PassPic from: " $1

img_size=$(identify $1 | cut -d" " -f3)
picture=$1

echo "Checking Image Size..."
if [ "$img_size" == "413x531" ]; 
    then
        echo "Picture Size is OKEY!"
    else
        echo "Picture Size FAILS... generate a new Picture...."
        d="New.jpg"
        convert $picture -resize 413x531\! $d
        picture=$d
fi
convert -size 1800x1200 xc:white bg.jpg

composite -geometry +0+0 $picture bg.jpg t.jpg
composite -geometry +414+0 $picture t.jpg t.jpg
composite -geometry +828+0 $picture t.jpg t.jpg
composite -geometry +1242+0 $picture t.jpg t.jpg

composite -geometry +0+532 $picture t.jpg t.jpg
composite -geometry +414+532 $picture t.jpg t.jpg
composite -geometry +828+532 $picture t.jpg t.jpg
composite -geometry +1242+532 $picture t.jpg PassPiccer.jpg

rm t.jpg
rm bg.jpg
rm $d

echo "*** Picture Complete! ***"
