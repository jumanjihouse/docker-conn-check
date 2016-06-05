#!/bin/sh

git clone https://github.com/1stvamp/conn-check.git
bzr branch -r ${VERSION} lp:conn-check
cd conn-check

make build-wheels
make build-wheels-all-extras

cd wheels

# Extract wheel files so we can tar them up later.
for file in *.whl; do
  unzip -o ${file};
done

# Remove the wheel files since we already extracted them.
rm -f *.whl

# Create a tarball of built files.
# This allows us to extract into the runtime image
# without adding compressed archives to the image.
# (ADD knows how to extract tarballs, but not zip files.)
tar cvzf ../wheels.tgz ./
