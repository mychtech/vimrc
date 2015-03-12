#条件にあうファイルを1ファイルずつ取り出す
find . -name "*.ctl" -type f | while read f
do
#単純置換する（改行は\nと記述）
#よくわからないけどとりあえず添付ファイルを経由する
perl -pe 's/cat/#cat/g' $f > tmp.txt
#元のファイルに挿入
perl -pe 's/bus/#b u \ns/g' tmp.txt > $f
done

