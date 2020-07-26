execute_process(COMMAND "/home/rxth/rakshith/data/work/asu/summer2020/kuka-path-planning-maze/catkin_ws/build/rll_move_client/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/rxth/rakshith/data/work/asu/summer2020/kuka-path-planning-maze/catkin_ws/build/rll_move_client/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
