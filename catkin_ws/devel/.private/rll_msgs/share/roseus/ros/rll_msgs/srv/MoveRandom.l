;; Auto-generated. Do not edit!


(when (boundp 'rll_msgs::MoveRandom)
  (if (not (find-package "RLL_MSGS"))
    (make-package "RLL_MSGS"))
  (shadow 'MoveRandom (find-package "RLL_MSGS")))
(unless (find-package "RLL_MSGS::MOVERANDOM")
  (make-package "RLL_MSGS::MOVERANDOM"))
(unless (find-package "RLL_MSGS::MOVERANDOMREQUEST")
  (make-package "RLL_MSGS::MOVERANDOMREQUEST"))
(unless (find-package "RLL_MSGS::MOVERANDOMRESPONSE")
  (make-package "RLL_MSGS::MOVERANDOMRESPONSE"))

(in-package "ROS")



(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass rll_msgs::MoveRandomRequest
  :super ros::object
  :slots ())

(defmethod rll_msgs::MoveRandomRequest
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

(defclass rll_msgs::MoveRandomResponse
  :super ros::object
  :slots (_pose _success _error_code ))

(defmethod rll_msgs::MoveRandomResponse
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:success __success) nil)
    ((:error_code __error_code) 0)
    )
   (send-super :init)
   (setq _pose __pose)
   (setq _success __success)
   (setq _error_code (round __error_code))
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:error_code
   (&optional __error_code)
   (if __error_code (setq _error_code __error_code)) _error_code)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; bool _success
    1
    ;; uint8 _error_code
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _error_code
       (write-byte _error_code s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _error_code
     (setq _error_code (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass rll_msgs::MoveRandom
  :super ros::object
  :slots ())

(setf (get rll_msgs::MoveRandom :md5sum-) "b292fbfae6ae3594727e822d1d4ce5a2")
(setf (get rll_msgs::MoveRandom :datatype-) "rll_msgs/MoveRandom")
(setf (get rll_msgs::MoveRandom :request) rll_msgs::MoveRandomRequest)
(setf (get rll_msgs::MoveRandom :response) rll_msgs::MoveRandomResponse)

(defmethod rll_msgs::MoveRandomRequest
  (:response () (instance rll_msgs::MoveRandomResponse :init)))

(setf (get rll_msgs::MoveRandomRequest :md5sum-) "b292fbfae6ae3594727e822d1d4ce5a2")
(setf (get rll_msgs::MoveRandomRequest :datatype-) "rll_msgs/MoveRandomRequest")
(setf (get rll_msgs::MoveRandomRequest :definition-)
      "---
geometry_msgs/Pose pose
bool success
uint8 error_code


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

(setf (get rll_msgs::MoveRandomResponse :md5sum-) "b292fbfae6ae3594727e822d1d4ce5a2")
(setf (get rll_msgs::MoveRandomResponse :datatype-) "rll_msgs/MoveRandomResponse")
(setf (get rll_msgs::MoveRandomResponse :definition-)
      "---
geometry_msgs/Pose pose
bool success
uint8 error_code


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



(provide :rll_msgs/MoveRandom "b292fbfae6ae3594727e822d1d4ce5a2")


