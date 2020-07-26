#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/rxth/rakshith/data/work/asu/summer2020/kuka-path-planning-maze/catkin_ws/src/rll_sdk/rll_move_client"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/rxth/rakshith/data/work/asu/summer2020/kuka-path-planning-maze/catkin_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/rxth/rakshith/data/work/asu/summer2020/kuka-path-planning-maze/catkin_ws/install/lib/python2.7/dist-packages:/home/rxth/rakshith/data/work/asu/summer2020/kuka-path-planning-maze/catkin_ws/build/rll_move_client/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/rxth/rakshith/data/work/asu/summer2020/kuka-path-planning-maze/catkin_ws/build/rll_move_client" \
    "/usr/bin/python2" \
    "/home/rxth/rakshith/data/work/asu/summer2020/kuka-path-planning-maze/catkin_ws/src/rll_sdk/rll_move_client/setup.py" \
     \
    build --build-base "/home/rxth/rakshith/data/work/asu/summer2020/kuka-path-planning-maze/catkin_ws/build/rll_move_client" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/rxth/rakshith/data/work/asu/summer2020/kuka-path-planning-maze/catkin_ws/install" --install-scripts="/home/rxth/rakshith/data/work/asu/summer2020/kuka-path-planning-maze/catkin_ws/install/bin"
