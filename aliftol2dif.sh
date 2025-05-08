echo "Breaking image and"
magick $1 -crop 100%x16.667% +repage o%d.png
echo "Sequencing it..."
magick o0.png o1.png o2.png o3.png o4.png o5.png +append $2.1.png

echo "trimming bottom border"
magick $2.1.png -gravity North -background white -splice 0x1 -background black -splice 0x1 -trim +repage -chop 0x1 $2.2.png
echo "trimming top border"
magick $2.2.png -gravity South -background white -splice 0x1 -background black -splice 0x1 -trim +repage -chop 0x1 $2

echo "removing tmp files..."
rm o0.png o1.png o2.png o3.png o4.png o5.png o6.png $2.1.png $2.2.png
