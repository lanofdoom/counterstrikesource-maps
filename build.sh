#!/bin/bash -ue

archive=${OUTPUT:-dist/maps.tar.gz}

tmp_dir=$(mktemp -d)
echo using temporary folder: $tmp_dir >&2
clean () {
    rm -rf $tmp_dir
    echo deleted temporary folder >&2
}
trap clean EXIT

for dir in */; do
    rsync -a $dir $tmp_dir --exclude 'README.md' --exclude 'LICENSE'
    cp $dir/README.md $tmp_dir/${dir%/}_readme.md
    cp $dir/LICENSE $tmp_dir/${dir%/}_license
done

mkdir -p downloadurl
cp -r $tmp_dir/* downloadurl/
echo created downloadurl

mkdir -p "$(dirname ${archive})"
tar -C $tmp_dir -czf "${archive}" .
echo created "${archive}" $(du -kh "${archive}" | cut -f1) >&2