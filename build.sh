#!/bin/bash -ue

archive=${OUTPUT:-dist/maps.tar.gz}

archive_tmp_dir=$(mktemp -d)
downloadurl_tmp_dir=$(mktemp -d)
echo using temporary folder: $archive_tmp_dir >&2
echo using temporary folder: $downloadurl_tmp_dir >&2
clean () {
    rm -rf $archive_tmp_dir
    rm -rf $downloadurl_tmp_dir
    echo deleted temporary folders >&2
}
trap clean EXIT

# Package downloadurl for HTTP mirror
for dir in */; do
    rsync -a $dir $downloadurl_tmp_dir --exclude 'README.md' --exclude 'LICENSE'
done

find $downloadurl_tmp_dir -type f -exec bzip2 {} +

for dir in */; do
    cp $dir/README.md $downloadurl_tmp_dir/${dir%/}_readme.md
    cp $dir/LICENSE $downloadurl_tmp_dir/${dir%/}_license
done

# Package tarball for server
cp -r $downloadurl_tmp_dir/* $archive_tmp_dir/

for dir in */; do
    rsync -a $dir $archive_tmp_dir --exclude 'README.md' --exclude 'LICENSE'
done

mkdir -p downloadurl
cp -r $downloadurl_tmp_dir/* downloadurl/
echo created downloadurl

mkdir -p "$(dirname ${archive})"
tar -C $archive_tmp_dir -czf "${archive}" .
echo created "${archive}" $(du -kh "${archive}" | cut -f1) >&2