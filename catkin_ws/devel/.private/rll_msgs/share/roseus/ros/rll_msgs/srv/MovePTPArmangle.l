;; Auto-generated. Do not edit!


(when (boundp 'rll_msgs::MovePTPArmangle)
  (if (not (find-package "RLL_MSGS"))
    (make-package "RLL_MSGS"))
  (shadow 'MovePTPArmangle (find-package "RLL_MSGS")))
(unless (find-package "RLL_MSGS::MOVEPTPARMANGLE")
  (make-package "RLL_MSGS::MOVEPTPARMANGLE"))
(unless (find-package "RLL_MSGS::MOVEPTPARMANGLEREQUEST")
  (make-package "RLL_MSGS::MOVEPTPARMANGLEREQUEST"))
(unless (find-package "RLL_MSGS::MOVEPTPARMANGLERESPONSE")
  (make-package "RLL_MSGS::MOVEPTPARMANGLERESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass rll_msgs::MovePTPArmangleRequest
  :super ros::object
  :slots (_pose _arm_angle ))

(defmethod rll_msgs::MovePTPArmangleRequest
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:arm_angle __arm_angle) 0.0)
    )
   (send-super :init)
   (setq _pose __pose)
   (setq _arm_angle (float __arm_angle))
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:arm_angle
   (&optional __arm_angle)
   (if __arm_angle (setq _arm_angle __arm_angle)) _arm_angle)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; float64 _arm_angle
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; float64 _arm_angle
       (sys::poke _arm_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; float64 _arm_angle
     (setq _arm_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass rll_msgs::MovePTPArmangleResponse
  :super ros::object
  :slots (_success _error_code ))

(defmethod rll_msgs::MovePTPArmangleResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:error_code __error_code) 0)
    )
   (send-super :init)
   (setq _success __success)
   (setq _error_code (round __error_code))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:error_code
   (&optional __error_code)
   (if __error_code (setq _error_code __error_code)) _error_code)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; uint8 _error_code
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _error_code
       (write-byte _error_code s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _error_code
     (setq _error_code (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass rll_msgs::MovePTPArmangle
  :super ros::object
  :slots ())

(setf (get rll_msgs::MovePTPArmangle :md5sum-) "120f4f54a5ecc4177ce4f86f46f94f5d")
(setf (get rll_msgs::MovePTPArmangle :datatype-) "rll_msgs/MovePTPArmangle")
(setf (get rll_msgs::MovePTPArmangle :request) rll_msgs::MovePTPArmangleRequest)
(setf (get rll_msgs::MovePTPArmangle :response) rll_msgs::MovePTPArmangleResponse)

(defmethod rll_msgs::MovePTPArmangleRequest
  (:response () (instance rll_msgs::MovePTPArmangleResponse :init)))

(setf (get rll_msgs::MovePTPArmangleRequest :md5sum-) "120f4f54a5ecc4177ce4f86f46f94f5d")
(setf (get rll_msgs::MovePTPArmangleRequest :datatype-) "rll_msgs/MovePTPArmangleRequest")
(setf (get rll_msgs::MovePTPArmangleRequest :definition-)
      "geometry_msgs/Pose pose
float64 arm_angle

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool success
uint8 error_code

")

(setf (get rll_msgs::MovePTPArmangleResponse :md5sum-) "120f4f54a5ecc4177ce4f86f46f94f5d")
(setf (get rll_msgs::MovePTPArmangleResponse :datatype-) "rll_msgs/MovePTPArmangleResponse")
(setf (get rll_msgs::MovePTPArmangleResponse :definition-)
      "geometry_msgs/Pose pose
float64 arm_angle

================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool success
uint8 error_code

")



(provide :rll_msgs/MovePTPArmangle "120f4f54a5ecc4177ce4f86f46f94f5d")


