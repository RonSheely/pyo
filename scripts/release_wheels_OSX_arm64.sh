#!/bin/sh

#  release_wheels_OSX_arm64.sh
#
# To upload wheels on test.pypi.org:
#   twine upload --repository-url https://test.pypi.org/legacy/ dist/*
#
# To upload wheels on pypi.org:
#   twine upload dist/*
#
# To update older pip:
#   curl https://bootstrap.pypa.io/get-pip.py | python(3)
#

version=1.0.5
replace=XXX

#### Clean up.
rm -rf build dist

#### Source distribution.
/usr/local/bin/python3.13 setup.py sdist

### Build pyo for python 3.9
/usr/local/bin/python3.9 -m build --config-setting="--build-option=--use-coreaudio" --config-setting="--build-option=--use-double" --config-setting="--build-option=--plat-name=macosx_13_0_arm64"

wheel_file=pyo-XXX-cp39-cp39-macosx_13_0_arm64.whl
dist_info=pyo-XXX.dist-info

if cd dist; then
    unzip ${wheel_file/$replace/$version}
    install_name_tool -change /opt/homebrew/opt/portmidi/lib/libportmidi.2.dylib @loader_path/libportmidi.2.0.3.dylib pyo/_pyo.cpython-39-darwin.so
    install_name_tool -change /opt/homebrew/opt/portmidi/lib/libportmidi.2.dylib @loader_path/libportmidi.2.0.3.dylib pyo/_pyo64.cpython-39-darwin.so
    install_name_tool -change /opt/homebrew/opt/portaudio/lib/libportaudio.2.dylib @loader_path/libportaudio.2.dylib pyo/_pyo.cpython-39-darwin.so
    install_name_tool -change /opt/homebrew/opt/portaudio/lib/libportaudio.2.dylib @loader_path/libportaudio.2.dylib pyo/_pyo64.cpython-39-darwin.so
    install_name_tool -change /opt/homebrew/opt/liblo/lib/liblo.7.dylib @loader_path/liblo.7.dylib pyo/_pyo.cpython-39-darwin.so
    install_name_tool -change /opt/homebrew/opt/liblo/lib/liblo.7.dylib @loader_path/liblo.7.dylib pyo/_pyo64.cpython-39-darwin.so
    install_name_tool -change /opt/homebrew/opt/libsndfile/lib/libsndfile.1.dylib @loader_path/libsndfile.1.0.37.dylib pyo/_pyo.cpython-39-darwin.so
    install_name_tool -change /opt/homebrew/opt/libsndfile/lib/libsndfile.1.dylib @loader_path/libsndfile.1.0.37.dylib pyo/_pyo64.cpython-39-darwin.so

    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libvorbis.0.dylib

    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libFLAC.14.dylib

    install_name_tool -change /opt/homebrew/Cellar/libvorbis/1.3.7/lib/libvorbis.0.dylib @loader_path/libvorbis.0.dylib pyo/libvorbisenc.2.dylib
    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libvorbisenc.2.dylib

    install_name_tool -change /opt/homebrew/Cellar/libvorbis/1.3.7/lib/libvorbis.0.dylib @loader_path/libvorbis.0.dylib pyo/libvorbisfile.3.dylib
    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libvorbisfile.3.dylib

    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/libvorbis/lib/libvorbisenc.2.dylib @loader_path/libvorbisenc.2.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/flac/lib/libFLAC.14.dylib @loader_path/libFLAC.14.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/opus/lib/libopus.0.dylib @loader_path/libopus.0.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/mpg123/lib/libmpg123.0.dylib @loader_path/libmpg123.0.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/lame/lib/libmp3lame.0.dylib @loader_path/libmp3lame.0.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/libvorbis/lib/libvorbis.0.dylib @loader_path/libvorbis.0.dylib pyo/libsndfile.1.0.37.dylib

    zip -r -X ${wheel_file/$replace/$version} ${dist_info/$replace/$version} pyo pyo64
    rm -rf ${dist_info/$replace/$version} pyo pyo64
    cd ..
else
    echo "*** Something went wrong when building for python 3.9..."
fi

### Build pyo for python 3.10
/usr/local/bin/python3.10 -m build --config-setting="--build-option=--use-coreaudio" --config-setting="--build-option=--use-double" --config-setting="--build-option=--plat-name=macosx_13_0_arm64"

wheel_file=pyo-XXX-cp310-cp310-macosx_13_0_arm64.whl
dist_info=pyo-XXX.dist-info

if cd dist; then
    unzip ${wheel_file/$replace/$version}
    install_name_tool -change /opt/homebrew/opt/portmidi/lib/libportmidi.2.dylib @loader_path/libportmidi.2.0.3.dylib pyo/_pyo.cpython-310-darwin.so
    install_name_tool -change /opt/homebrew/opt/portmidi/lib/libportmidi.2.dylib @loader_path/libportmidi.2.0.3.dylib pyo/_pyo64.cpython-310-darwin.so
    install_name_tool -change /opt/homebrew/opt/portaudio/lib/libportaudio.2.dylib @loader_path/libportaudio.2.dylib pyo/_pyo.cpython-310-darwin.so
    install_name_tool -change /opt/homebrew/opt/portaudio/lib/libportaudio.2.dylib @loader_path/libportaudio.2.dylib pyo/_pyo64.cpython-310-darwin.so
    install_name_tool -change /opt/homebrew/opt/liblo/lib/liblo.7.dylib @loader_path/liblo.7.dylib pyo/_pyo.cpython-310-darwin.so
    install_name_tool -change /opt/homebrew/opt/liblo/lib/liblo.7.dylib @loader_path/liblo.7.dylib pyo/_pyo64.cpython-310-darwin.so
    install_name_tool -change /opt/homebrew/opt/libsndfile/lib/libsndfile.1.dylib @loader_path/libsndfile.1.0.37.dylib pyo/_pyo.cpython-310-darwin.so
    install_name_tool -change /opt/homebrew/opt/libsndfile/lib/libsndfile.1.dylib @loader_path/libsndfile.1.0.37.dylib pyo/_pyo64.cpython-310-darwin.so

    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libvorbis.0.dylib

    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libFLAC.14.dylib

    install_name_tool -change /opt/homebrew/Cellar/libvorbis/1.3.7/lib/libvorbis.0.dylib @loader_path/libvorbis.0.dylib pyo/libvorbisenc.2.dylib
    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libvorbisenc.2.dylib

    install_name_tool -change /opt/homebrew/Cellar/libvorbis/1.3.7/lib/libvorbis.0.dylib @loader_path/libvorbis.0.dylib pyo/libvorbisfile.3.dylib
    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libvorbisfile.3.dylib

    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/libvorbis/lib/libvorbisenc.2.dylib @loader_path/libvorbisenc.2.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/flac/lib/libFLAC.14.dylib @loader_path/libFLAC.14.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/opus/lib/libopus.0.dylib @loader_path/libopus.0.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/mpg123/lib/libmpg123.0.dylib @loader_path/libmpg123.0.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/lame/lib/libmp3lame.0.dylib @loader_path/libmp3lame.0.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/libvorbis/lib/libvorbis.0.dylib @loader_path/libvorbis.0.dylib pyo/libsndfile.1.0.37.dylib

    zip -r -X ${wheel_file/$replace/$version} ${dist_info/$replace/$version} pyo pyo64
    rm -rf ${dist_info/$replace/$version} pyo pyo64
    cd ..
else
    echo "*** Something went wrong when building for python 3.10..."
fi

### Build pyo for python 3.11
/usr/local/bin/python3.11 -m build --config-setting="--build-option=--use-coreaudio" --config-setting="--build-option=--use-double" --config-setting="--build-option=--plat-name=macosx_13_0_arm64"

wheel_file=pyo-XXX-cp311-cp311-macosx_13_0_arm64.whl
dist_info=pyo-XXX.dist-info

if cd dist; then
    unzip ${wheel_file/$replace/$version}
    install_name_tool -change /opt/homebrew/opt/portmidi/lib/libportmidi.2.dylib @loader_path/libportmidi.2.0.3.dylib pyo/_pyo.cpython-311-darwin.so
    install_name_tool -change /opt/homebrew/opt/portmidi/lib/libportmidi.2.dylib @loader_path/libportmidi.2.0.3.dylib pyo/_pyo64.cpython-311-darwin.so
    install_name_tool -change /opt/homebrew/opt/portaudio/lib/libportaudio.2.dylib @loader_path/libportaudio.2.dylib pyo/_pyo.cpython-311-darwin.so
    install_name_tool -change /opt/homebrew/opt/portaudio/lib/libportaudio.2.dylib @loader_path/libportaudio.2.dylib pyo/_pyo64.cpython-311-darwin.so
    install_name_tool -change /opt/homebrew/opt/liblo/lib/liblo.7.dylib @loader_path/liblo.7.dylib pyo/_pyo.cpython-311-darwin.so
    install_name_tool -change /opt/homebrew/opt/liblo/lib/liblo.7.dylib @loader_path/liblo.7.dylib pyo/_pyo64.cpython-311-darwin.so
    install_name_tool -change /opt/homebrew/opt/libsndfile/lib/libsndfile.1.dylib @loader_path/libsndfile.1.0.37.dylib pyo/_pyo.cpython-311-darwin.so
    install_name_tool -change /opt/homebrew/opt/libsndfile/lib/libsndfile.1.dylib @loader_path/libsndfile.1.0.37.dylib pyo/_pyo64.cpython-311-darwin.so

    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libvorbis.0.dylib

    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libFLAC.14.dylib

    install_name_tool -change /opt/homebrew/Cellar/libvorbis/1.3.7/lib/libvorbis.0.dylib @loader_path/libvorbis.0.dylib pyo/libvorbisenc.2.dylib
    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libvorbisenc.2.dylib

    install_name_tool -change /opt/homebrew/Cellar/libvorbis/1.3.7/lib/libvorbis.0.dylib @loader_path/libvorbis.0.dylib pyo/libvorbisfile.3.dylib
    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libvorbisfile.3.dylib

    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/libvorbis/lib/libvorbisenc.2.dylib @loader_path/libvorbisenc.2.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/flac/lib/libFLAC.14.dylib @loader_path/libFLAC.14.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/opus/lib/libopus.0.dylib @loader_path/libopus.0.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/mpg123/lib/libmpg123.0.dylib @loader_path/libmpg123.0.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/lame/lib/libmp3lame.0.dylib @loader_path/libmp3lame.0.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/libvorbis/lib/libvorbis.0.dylib @loader_path/libvorbis.0.dylib pyo/libsndfile.1.0.37.dylib

    zip -r -X ${wheel_file/$replace/$version} ${dist_info/$replace/$version} pyo pyo64
    rm -rf ${dist_info/$replace/$version} pyo pyo64
    cd ..
else
    echo "*** Something went wrong when building for python 3.11..."
fi

### Build pyo for python 3.12
/usr/local/bin/python3.12 -m build --config-setting="--build-option=--use-coreaudio" --config-setting="--build-option=--use-double" --config-setting="--build-option=--plat-name=macosx_13_0_arm64"

wheel_file=pyo-XXX-cp312-cp312-macosx_13_0_arm64.whl
dist_info=pyo-XXX.dist-info

if cd dist; then
    unzip ${wheel_file/$replace/$version}
    install_name_tool -change /opt/homebrew/opt/portmidi/lib/libportmidi.2.dylib @loader_path/libportmidi.2.0.3.dylib pyo/_pyo.cpython-312-darwin.so
    install_name_tool -change /opt/homebrew/opt/portmidi/lib/libportmidi.2.dylib @loader_path/libportmidi.2.0.3.dylib pyo/_pyo64.cpython-312-darwin.so
    install_name_tool -change /opt/homebrew/opt/portaudio/lib/libportaudio.2.dylib @loader_path/libportaudio.2.dylib pyo/_pyo.cpython-312-darwin.so
    install_name_tool -change /opt/homebrew/opt/portaudio/lib/libportaudio.2.dylib @loader_path/libportaudio.2.dylib pyo/_pyo64.cpython-312-darwin.so
    install_name_tool -change /opt/homebrew/opt/liblo/lib/liblo.7.dylib @loader_path/liblo.7.dylib pyo/_pyo.cpython-312-darwin.so
    install_name_tool -change /opt/homebrew/opt/liblo/lib/liblo.7.dylib @loader_path/liblo.7.dylib pyo/_pyo64.cpython-312-darwin.so
    install_name_tool -change /opt/homebrew/opt/libsndfile/lib/libsndfile.1.dylib @loader_path/libsndfile.1.0.37.dylib pyo/_pyo.cpython-312-darwin.so
    install_name_tool -change /opt/homebrew/opt/libsndfile/lib/libsndfile.1.dylib @loader_path/libsndfile.1.0.37.dylib pyo/_pyo64.cpython-312-darwin.so

    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libvorbis.0.dylib

    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libFLAC.14.dylib

    install_name_tool -change /opt/homebrew/Cellar/libvorbis/1.3.7/lib/libvorbis.0.dylib @loader_path/libvorbis.0.dylib pyo/libvorbisenc.2.dylib
    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libvorbisenc.2.dylib

    install_name_tool -change /opt/homebrew/Cellar/libvorbis/1.3.7/lib/libvorbis.0.dylib @loader_path/libvorbis.0.dylib pyo/libvorbisfile.3.dylib
    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libvorbisfile.3.dylib

    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/libvorbis/lib/libvorbisenc.2.dylib @loader_path/libvorbisenc.2.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/flac/lib/libFLAC.14.dylib @loader_path/libFLAC.14.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/opus/lib/libopus.0.dylib @loader_path/libopus.0.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/mpg123/lib/libmpg123.0.dylib @loader_path/libmpg123.0.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/lame/lib/libmp3lame.0.dylib @loader_path/libmp3lame.0.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/libvorbis/lib/libvorbis.0.dylib @loader_path/libvorbis.0.dylib pyo/libsndfile.1.0.37.dylib

    zip -r -X ${wheel_file/$replace/$version} ${dist_info/$replace/$version} pyo pyo64
    rm -rf ${dist_info/$replace/$version} pyo pyo64
    cd ..
else
    echo "*** Something went wrong when building for python 3.12..."
fi

### Build pyo for python 3.13
/usr/local/bin/python3.13 -m build --config-setting="--build-option=--use-coreaudio" --config-setting="--build-option=--use-double" --config-setting="--build-option=--plat-name=macosx_13_0_arm64"

wheel_file=pyo-XXX-cp313-cp313-macosx_13_0_arm64.whl
dist_info=pyo-XXX.dist-info

if cd dist; then
    unzip ${wheel_file/$replace/$version}
    install_name_tool -change /opt/homebrew/opt/portmidi/lib/libportmidi.2.dylib @loader_path/libportmidi.2.0.3.dylib pyo/_pyo.cpython-313-darwin.so
    install_name_tool -change /opt/homebrew/opt/portmidi/lib/libportmidi.2.dylib @loader_path/libportmidi.2.0.3.dylib pyo/_pyo64.cpython-313-darwin.so
    install_name_tool -change /opt/homebrew/opt/portaudio/lib/libportaudio.2.dylib @loader_path/libportaudio.2.dylib pyo/_pyo.cpython-313-darwin.so
    install_name_tool -change /opt/homebrew/opt/portaudio/lib/libportaudio.2.dylib @loader_path/libportaudio.2.dylib pyo/_pyo64.cpython-313-darwin.so
    install_name_tool -change /opt/homebrew/opt/liblo/lib/liblo.7.dylib @loader_path/liblo.7.dylib pyo/_pyo.cpython-313-darwin.so
    install_name_tool -change /opt/homebrew/opt/liblo/lib/liblo.7.dylib @loader_path/liblo.7.dylib pyo/_pyo64.cpython-313-darwin.so
    install_name_tool -change /opt/homebrew/opt/libsndfile/lib/libsndfile.1.dylib @loader_path/libsndfile.1.0.37.dylib pyo/_pyo.cpython-313-darwin.so
    install_name_tool -change /opt/homebrew/opt/libsndfile/lib/libsndfile.1.dylib @loader_path/libsndfile.1.0.37.dylib pyo/_pyo64.cpython-313-darwin.so

    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libvorbis.0.dylib

    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libFLAC.14.dylib

    install_name_tool -change /opt/homebrew/Cellar/libvorbis/1.3.7/lib/libvorbis.0.dylib @loader_path/libvorbis.0.dylib pyo/libvorbisenc.2.dylib
    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libvorbisenc.2.dylib

    install_name_tool -change /opt/homebrew/Cellar/libvorbis/1.3.7/lib/libvorbis.0.dylib @loader_path/libvorbis.0.dylib pyo/libvorbisfile.3.dylib
    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libvorbisfile.3.dylib

    install_name_tool -change /opt/homebrew/opt/libogg/lib/libogg.0.dylib @loader_path/libogg.0.8.5.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/libvorbis/lib/libvorbisenc.2.dylib @loader_path/libvorbisenc.2.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/flac/lib/libFLAC.14.dylib @loader_path/libFLAC.14.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/opus/lib/libopus.0.dylib @loader_path/libopus.0.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/mpg123/lib/libmpg123.0.dylib @loader_path/libmpg123.0.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/lame/lib/libmp3lame.0.dylib @loader_path/libmp3lame.0.dylib pyo/libsndfile.1.0.37.dylib
    install_name_tool -change /opt/homebrew/opt/libvorbis/lib/libvorbis.0.dylib @loader_path/libvorbis.0.dylib pyo/libsndfile.1.0.37.dylib

    zip -r -X ${wheel_file/$replace/$version} ${dist_info/$replace/$version} pyo pyo64
    rm -rf ${dist_info/$replace/$version} pyo pyo64
    cd ..
else
    echo "*** Something went wrong when building for python 3.13..."
fi
