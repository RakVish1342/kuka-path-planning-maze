;; Auto-generated. Do not edit!


(when (boundp 'rll_msgs::MoveLin)
  (if (not (find-package "RLL_MSGS"))
    (make-package "RLL_MSGS"))
  (shadow 'MoveLin (find-package "RLL_MSGS")))
(unless (find-package "RLL_MSGS::MOVELIN")
  (make-package "RLL_MSGS::MOVELIN"))
(unless (find-package "RLL_MSGS::MOVELINREQUEST")
  (make-package "RLL_MSGS::MOVELINREQUEST"))
(unless (find-package "RLL_MSGS::MOVELINRESPONSE")
  (make-package "RLL_MSGS::MOVELINRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))




(defclass rll_msgs::MoveLinRequest
  :super ros::object
  :slots (_pose ))

(defmethod rll_msgs::MoveLinRequest
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _pose __pose)
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(defclass rll_msgs::MoveLinResponse
  :super ros::object
  :slots (_success _error_code ))

(defmethod rll_msgs::MoveLinResponse
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

(defclass rll_msgs::MoveLin
  :super ros::object
  :slots ())

(setf (get rll_msgs::MoveLin :md5sum-) "906eaa149aa69bf11e4f5f1c416e3b33")
(setf (get rll_msgs::MoveLin :datatype-) "rll_msgs/MoveLin")
(setf (get rll_msgs::MoveLin :request) rll_msgs::MoveLinRequest)
(setf (get rll_msgs::MoveLin :response) rll_msgs::MoveLinResponse)

(defmethod rll_msgs::MoveLinRequest
  (:response () (instance rll_msgs::MoveLinResponse :init)))

(setf (get rll_msgs::MoveLinRequest :md5sum-) "906eaa149aa69bf11e4f5f1c416e3b33")
(setf (get rll_msgs::MoveLinRequest :datatype-) "rll_msgs/MoveLinRequest")
(setf (get rll_msgs::MoveLinRequest :definition-)
      "geometry_msgs/Pose pose

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

(setf (get rll_msgs::MoveLinResponse :md5sum-) "906eaa149aa69bf11e4f5f1c416e3b33")
(setf (get rll_msgs::MoveLinResponse :datatype-) "rll_msgs/MoveLinResponse")
(setf (get rll_msgs::MoveLinResponse :definition-)
      "geometry_msgs/Pose pose

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



(provide :rll_msgs/MoveLin "906eaa149aa69bf11e4f5f1c416e3b33")


