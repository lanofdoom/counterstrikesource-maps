#!/bin/bash -ue

archive=${OUTPUT:-dist/maps.tar.xz}

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

# Generate script with list of commands to bzip2 the maps data for tarball
pushd $downloadurl_tmp_dir
echo "#!/bin/bash -ue" > $archive_tmp_dir/make_bz2_files.sh
find . -type f -exec echo "bzip2 -k {}" \; > $archive_tmp_dir/make_bz2_files.sh
chmod +x $archive_tmp_dir/make_bz2_files.sh
popd

# bzip2 compress the downloadurl files for the HTTP mirror
find $downloadurl_tmp_dir -type f -exec bzip2 {} +

# Package tarball for server
for dir in */; do
    rsync -a $dir $archive_tmp_dir --exclude 'README.md' --exclude 'LICENSE'
    cp $dir/README.md $archive_tmp_dir/${dir%/}_readme.md
    cp $dir/LICENSE $archive_tmp_dir/${dir%/}_license
done

mkdir -p downloadurl
cp -r $downloadurl_tmp_dir/* downloadurl/
echo created downloadurl

mkdir -p "$(dirname ${archive})"
tar -C $archive_tmp_dir -Jcvf "${archive}" .
echo created "${archive}" $(du -kh "${archive}" | cut -f1) >&2