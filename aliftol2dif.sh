

A="aliftol2dif__m__"

echo "Breaking image and"
magick $1 -crop 100%x16.667% +repage ${A}%d.png
echo "Sequencing it..."
magick ${A}0.png ${A}1.png ${A}2.png ${A}3.png ${A}4.png ${A}5.png +append ${2}.1.png

echo "trimming bottom border"
magick $2.1.png -gravity North -background white -splice 0x1 -background black -splice 0x1 -trim +repage -chop 0x1 $2.2.png
echo "trimming top border"
magick $2.2.png -gravity South -background white -splice 0x1 -background black -splice 0x1 -trim +repage -chop 0x1 $2

echo "removing tmp files..."
rm ${A}0.png ${A}1.png ${A}2.png ${A}3.png ${A}4.png ${A}5.png ${A}6.png $2.1.png $2.2.png
