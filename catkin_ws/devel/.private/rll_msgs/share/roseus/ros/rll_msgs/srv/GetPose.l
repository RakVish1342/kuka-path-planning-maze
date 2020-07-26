;; Auto-generated. Do not edit!


(when (boundp 'rll_msgs::GetPose)
  (if (not (find-package "RLL_MSGS"))
    (make-package "RLL_MSGS"))
  (shadow 'GetPose (find-package "RLL_MSGS")))
(unless (find-package "RLL_MSGS::GETPOSE")
  (make-package "RLL_MSGS::GETPOSE"))
(unless (find-package "RLL_MSGS::GETPOSEREQUEST")
  (make-package "RLL_MSGS::GETPOSEREQUEST"))
(unless (find-package "RLL_MSGS::GETPOSERESPONSE")
  (make-package "RLL_MSGS::GETPOSERESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass rll_msgs::GetPoseRequest
  :super ros::object
  :slots ())

(defmethod rll_msgs::GetPoseRequest
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

(defclass rll_msgs::GetPoseResponse
  :super ros::object
  :slots (_success _error_code _pose _arm_angle _config ))

(defmethod rll_msgs::GetPoseResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:error_code __error_code) 0)
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:arm_angle __arm_angle) 0.0)
    ((:config __config) 0)
    )
   (send-super :init)
   (setq _success __success)
   (setq _error_code (round __error_code))
   (setq _pose __pose)
   (setq _arm_angle (float __arm_angle))
   (setq _config (round __config))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:error_code
   (&optional __error_code)
   (if __error_code (setq _error_code __error_code)) _error_code)
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
  (:config
   (&optional __config)
   (if __config (setq _config __config)) _config)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; uint8 _error_code
    1
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; float64 _arm_angle
    8
    ;; uint8 _config
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
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; float64 _arm_angle
       (sys::poke _arm_angle (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _config
       (write-byte _config s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _error_code
     (setq _error_code (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; float64 _arm_angle
     (setq _arm_angle (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _config
     (setq _config (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass rll_msgs::GetPose
  :super ros::object
  :slots ())

(setf (get rll_msgs::GetPose :md5sum-) "00cfbf912d5d5d335e09a4e695a7bfef")
(setf (get rll_msgs::GetPose :datatype-) "rll_msgs/GetPose")
(setf (get rll_msgs::GetPose :request) rll_msgs::GetPoseRequest)
(setf (get rll_msgs::GetPose :response) rll_msgs::GetPoseResponse)

(defmethod rll_msgs::GetPoseRequest
  (:response () (instance rll_msgs::GetPoseResponse :init)))

(setf (get rll_msgs::GetPoseRequest :md5sum-) "00cfbf912d5d5d335e09a4e695a7bfef")
(setf (get rll_msgs::GetPoseRequest :datatype-) "rll_msgs/GetPoseRequest")
(setf (get rll_msgs::GetPoseRequest :definition-)
      "---
bool success
uint8 error_code
geometry_msgs/Pose pose
float64 arm_angle
uint8 config


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
")

(setf (get rll_msgs::GetPoseResponse :md5sum-) "00cfbf912d5d5d335e09a4e695a7bfef")
(setf (get rll_msgs::GetPoseResponse :datatype-) "rll_msgs/GetPoseResponse")
(setf (get rll_msgs::GetPoseResponse :definition-)
      "---
bool success
uint8 error_code
geometry_msgs/Pose pose
float64 arm_angle
uint8 config


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
")



(provide :rll_msgs/GetPose "00cfbf912d5d5d335e09a4e695a7bfef")


