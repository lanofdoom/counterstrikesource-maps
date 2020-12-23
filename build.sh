#!/bin/bash -ue

archive=maps.tar.gz

tmp_dir=$(mktemp -d)
echo using temporary folder: $tmp_dir >&2
clean () {
    rm -rf $tmp_dir
    echo deleted temporary folder >&2
}
trap clean EXIT

for dir in */; do
    rsync -a $dir $tmp_dir --exclude 'README*'
done

tar -C $tmp_dir -czf $archive .
echo created $archive $(du -kh $archive | cut -f1) >&2
