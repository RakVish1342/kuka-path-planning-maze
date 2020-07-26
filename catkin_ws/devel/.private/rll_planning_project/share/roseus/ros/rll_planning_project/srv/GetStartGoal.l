;; Auto-generated. Do not edit!


(when (boundp 'rll_planning_project::GetStartGoal)
  (if (not (find-package "RLL_PLANNING_PROJECT"))
    (make-package "RLL_PLANNING_PROJECT"))
  (shadow 'GetStartGoal (find-package "RLL_PLANNING_PROJECT")))
(unless (find-package "RLL_PLANNING_PROJECT::GETSTARTGOAL")
  (make-package "RLL_PLANNING_PROJECT::GETSTARTGOAL"))
(unless (find-package "RLL_PLANNING_PROJECT::GETSTARTGOALREQUEST")
  (make-package "RLL_PLANNING_PROJECT::GETSTARTGOALREQUEST"))
(unless (find-package "RLL_PLANNING_PROJECT::GETSTARTGOALRESPONSE")
  (make-package "RLL_PLANNING_PROJECT::GETSTARTGOALRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass rll_planning_project::GetStartGoalRequest
  :super ros::object
  :slots ())

(defmethod rll_planning_project::GetStartGoalRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass rll_planning_project::GetStartGoalResponse
  :super ros::object
  :slots (_success _error_code _start _goal ))

(defmethod rll_planning_project::GetStartGoalResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:error_code __error_code) 0)
    ((:start __start) (instance geometry_msgs::Pose2D :init))
    ((:goal __goal) (instance geometry_msgs::Pose2D :init))
    )
   (send-super :init)
   (setq _success __success)
   (setq _error_code (round __error_code))
   (setq _start __start)
   (setq _goal __goal)
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:error_code
   (&optional __error_code)
   (if __error_code (setq _error_code __error_code)) _error_code)
  (:start
   (&rest __start)
   (if (keywordp (car __start))
       (send* _start __start)
     (progn
       (if __start (setq _start (car __start)))
       _start)))
  (:goal
   (&rest __goal)
   (if (keywordp (car __goal))
       (send* _goal __goal)
     (progn
       (if __goal (setq _goal (car __goal)))
       _goal)))
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; uint8 _error_code
    1
    ;; geometry_msgs/Pose2D _start
    (send _start :serialization-length)
    ;; geometry_msgs/Pose2D _goal
    (send _goal :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _error_code
       (write-byte _error_code s)
     ;; geometry_msgs/Pose2D _start
       (send _start :serialize s)
     ;; geometry_msgs/Pose2D _goal
       (send _goal :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _error_code
     (setq _error_code (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; geometry_msgs/Pose2D _start
     (send _start :deserialize buf ptr-) (incf ptr- (send _start :serialization-length))
   ;; geometry_msgs/Pose2D _goal
     (send _goal :deserialize buf ptr-) (incf ptr- (send _goal :serialization-length))
   ;;
   self)
  )

(defclass rll_planning_project::GetStartGoal
  :super ros::object
  :slots ())

(setf (get rll_planning_project::GetStartGoal :md5sum-) "20f5244415b7ff944aeb9f4f84fb11ce")
(setf (get rll_planning_project::GetStartGoal :datatype-) "rll_planning_project/GetStartGoal")
(setf (get rll_planning_project::GetStartGoal :request) rll_planning_project::GetStartGoalRequest)
(setf (get rll_planning_project::GetStartGoal :response) rll_planning_project::GetStartGoalResponse)

(defmethod rll_planning_project::GetStartGoalRequest
  (:response () (instance rll_planning_project::GetStartGoalResponse :init)))

(setf (get rll_planning_project::GetStartGoalRequest :md5sum-) "20f5244415b7ff944aeb9f4f84fb11ce")
(setf (get rll_planning_project::GetStartGoalRequest :datatype-) "rll_planning_project/GetStartGoalRequest")
(setf (get rll_planning_project::GetStartGoalRequest :definition-)
      "---
bool success
uint8 error_code
geometry_msgs/Pose2D start
geometry_msgs/Pose2D goal


================================================================================
MSG: geometry_msgs/Pose2D
# Deprecated
# Please use the full 3D pose.

# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.

# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.


# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta
")

(setf (get rll_planning_project::GetStartGoalResponse :md5sum-) "20f5244415b7ff944aeb9f4f84fb11ce")
(setf (get rll_planning_project::GetStartGoalResponse :datatype-) "rll_planning_project/GetStartGoalResponse")
(setf (get rll_planning_project::GetStartGoalResponse :definition-)
      "---
bool success
uint8 error_code
geometry_msgs/Pose2D start
geometry_msgs/Pose2D goal


================================================================================
MSG: geometry_msgs/Pose2D
# Deprecated
# Please use the full 3D pose.

# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.

# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.


# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta
")



(provide :rll_planning_project/GetStartGoal "20f5244415b7ff944aeb9f4f84fb11ce")


