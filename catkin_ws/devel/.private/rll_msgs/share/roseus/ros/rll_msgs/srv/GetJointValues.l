;; Auto-generated. Do not edit!


(when (boundp 'rll_msgs::GetJointValues)
  (if (not (find-package "RLL_MSGS"))
    (make-package "RLL_MSGS"))
  (shadow 'GetJointValues (find-package "RLL_MSGS")))
(unless (find-package "RLL_MSGS::GETJOINTVALUES")
  (make-package "RLL_MSGS::GETJOINTVALUES"))
(unless (find-package "RLL_MSGS::GETJOINTVALUESREQUEST")
  (make-package "RLL_MSGS::GETJOINTVALUESREQUEST"))
(unless (find-package "RLL_MSGS::GETJOINTVALUESRESPONSE")
  (make-package "RLL_MSGS::GETJOINTVALUESRESPONSE"))

(in-package "ROS")





(defclass rll_msgs::GetJointValuesRequest
  :super ros::object
  :slots ())

(defmethod rll_msgs::GetJointValuesRequest
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

(defclass rll_msgs::GetJointValuesResponse
  :super ros::object
  :slots (_success _error_code _joint_1 _joint_2 _joint_3 _joint_4 _joint_5 _joint_6 _joint_7 ))

(defmethod rll_msgs::GetJointValuesResponse
  (:init
   (&key
    ((:success __success) nil)
    ((:error_code __error_code) 0)
    ((:joint_1 __joint_1) 0.0)
    ((:joint_2 __joint_2) 0.0)
    ((:joint_3 __joint_3) 0.0)
    ((:joint_4 __joint_4) 0.0)
    ((:joint_5 __joint_5) 0.0)
    ((:joint_6 __joint_6) 0.0)
    ((:joint_7 __joint_7) 0.0)
    )
   (send-super :init)
   (setq _success __success)
   (setq _error_code (round __error_code))
   (setq _joint_1 (float __joint_1))
   (setq _joint_2 (float __joint_2))
   (setq _joint_3 (float __joint_3))
   (setq _joint_4 (float __joint_4))
   (setq _joint_5 (float __joint_5))
   (setq _joint_6 (float __joint_6))
   (setq _joint_7 (float __joint_7))
   self)
  (:success
   (&optional __success)
   (if __success (setq _success __success)) _success)
  (:error_code
   (&optional __error_code)
   (if __error_code (setq _error_code __error_code)) _error_code)
  (:joint_1
   (&optional __joint_1)
   (if __joint_1 (setq _joint_1 __joint_1)) _joint_1)
  (:joint_2
   (&optional __joint_2)
   (if __joint_2 (setq _joint_2 __joint_2)) _joint_2)
  (:joint_3
   (&optional __joint_3)
   (if __joint_3 (setq _joint_3 __joint_3)) _joint_3)
  (:joint_4
   (&optional __joint_4)
   (if __joint_4 (setq _joint_4 __joint_4)) _joint_4)
  (:joint_5
   (&optional __joint_5)
   (if __joint_5 (setq _joint_5 __joint_5)) _joint_5)
  (:joint_6
   (&optional __joint_6)
   (if __joint_6 (setq _joint_6 __joint_6)) _joint_6)
  (:joint_7
   (&optional __joint_7)
   (if __joint_7 (setq _joint_7 __joint_7)) _joint_7)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ;; uint8 _error_code
    1
    ;; float64 _joint_1
    8
    ;; float64 _joint_2
    8
    ;; float64 _joint_3
    8
    ;; float64 _joint_4
    8
    ;; float64 _joint_5
    8
    ;; float64 _joint_6
    8
    ;; float64 _joint_7
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;; uint8 _error_code
       (write-byte _error_code s)
     ;; float64 _joint_1
       (sys::poke _joint_1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _joint_2
       (sys::poke _joint_2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _joint_3
       (sys::poke _joint_3 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _joint_4
       (sys::poke _joint_4 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _joint_5
       (sys::poke _joint_5 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _joint_6
       (sys::poke _joint_6 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _joint_7
       (sys::poke _joint_7 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; uint8 _error_code
     (setq _error_code (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float64 _joint_1
     (setq _joint_1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _joint_2
     (setq _joint_2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _joint_3
     (setq _joint_3 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _joint_4
     (setq _joint_4 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _joint_5
     (setq _joint_5 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _joint_6
     (setq _joint_6 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _joint_7
     (setq _joint_7 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass rll_msgs::GetJointValues
  :super ros::object
  :slots ())

(setf (get rll_msgs::GetJointValues :md5sum-) "8e5a3555469b4e8d3327599e7f25c1a4")
(setf (get rll_msgs::GetJointValues :datatype-) "rll_msgs/GetJointValues")
(setf (get rll_msgs::GetJointValues :request) rll_msgs::GetJointValuesRequest)
(setf (get rll_msgs::GetJointValues :response) rll_msgs::GetJointValuesResponse)

(defmethod rll_msgs::GetJointValuesRequest
  (:response () (instance rll_msgs::GetJointValuesResponse :init)))

(setf (get rll_msgs::GetJointValuesRequest :md5sum-) "8e5a3555469b4e8d3327599e7f25c1a4")
(setf (get rll_msgs::GetJointValuesRequest :datatype-) "rll_msgs/GetJointValuesRequest")
(setf (get rll_msgs::GetJointValuesRequest :definition-)
      "---
bool success
uint8 error_code
float64 joint_1
float64 joint_2
float64 joint_3
float64 joint_4
float64 joint_5
float64 joint_6
float64 joint_7

")

(setf (get rll_msgs::GetJointValuesResponse :md5sum-) "8e5a3555469b4e8d3327599e7f25c1a4")
(setf (get rll_msgs::GetJointValuesResponse :datatype-) "rll_msgs/GetJointValuesResponse")
(setf (get rll_msgs::GetJointValuesResponse :definition-)
      "---
bool success
uint8 error_code
float64 joint_1
float64 joint_2
float64 joint_3
float64 joint_4
float64 joint_5
float64 joint_6
float64 joint_7

")



(provide :rll_msgs/GetJointValues "8e5a3555469b4e8d3327599e7f25c1a4")


