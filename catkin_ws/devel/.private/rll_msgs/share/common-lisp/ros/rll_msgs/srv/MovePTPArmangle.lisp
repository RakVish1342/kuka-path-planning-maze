; Auto-generated. Do not edit!


(cl:in-package rll_msgs-srv)


;//! \htmlinclude MovePTPArmangle-request.msg.html

(cl:defclass <MovePTPArmangle-request> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (arm_angle
    :reader arm_angle
    :initarg :arm_angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass MovePTPArmangle-request (<MovePTPArmangle-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovePTPArmangle-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovePTPArmangle-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rll_msgs-srv:<MovePTPArmangle-request> is deprecated: use rll_msgs-srv:MovePTPArmangle-request instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <MovePTPArmangle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:pose-val is deprecated.  Use rll_msgs-srv:pose instead.")
  (pose m))

(cl:ensure-generic-function 'arm_angle-val :lambda-list '(m))
(cl:defmethod arm_angle-val ((m <MovePTPArmangle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:arm_angle-val is deprecated.  Use rll_msgs-srv:arm_angle instead.")
  (arm_angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovePTPArmangle-request>) ostream)
  "Serializes a message object of type '<MovePTPArmangle-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'arm_angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovePTPArmangle-request>) istream)
  "Deserializes a message object of type '<MovePTPArmangle-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'arm_angle) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovePTPArmangle-request>)))
  "Returns string type for a service object of type '<MovePTPArmangle-request>"
  "rll_msgs/MovePTPArmangleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovePTPArmangle-request)))
  "Returns string type for a service object of type 'MovePTPArmangle-request"
  "rll_msgs/MovePTPArmangleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovePTPArmangle-request>)))
  "Returns md5sum for a message object of type '<MovePTPArmangle-request>"
  "120f4f54a5ecc4177ce4f86f46f94f5d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovePTPArmangle-request)))
  "Returns md5sum for a message object of type 'MovePTPArmangle-request"
  "120f4f54a5ecc4177ce4f86f46f94f5d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovePTPArmangle-request>)))
  "Returns full string definition for message of type '<MovePTPArmangle-request>"
  (cl:format cl:nil "geometry_msgs/Pose pose~%float64 arm_angle~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovePTPArmangle-request)))
  "Returns full string definition for message of type 'MovePTPArmangle-request"
  (cl:format cl:nil "geometry_msgs/Pose pose~%float64 arm_angle~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovePTPArmangle-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovePTPArmangle-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MovePTPArmangle-request
    (cl:cons ':pose (pose msg))
    (cl:cons ':arm_angle (arm_angle msg))
))
;//! \htmlinclude MovePTPArmangle-response.msg.html

(cl:defclass <MovePTPArmangle-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (error_code
    :reader error_code
    :initarg :error_code
    :type cl:fixnum
    :initform 0))
)

(cl:defclass MovePTPArmangle-response (<MovePTPArmangle-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovePTPArmangle-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovePTPArmangle-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rll_msgs-srv:<MovePTPArmangle-response> is deprecated: use rll_msgs-srv:MovePTPArmangle-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MovePTPArmangle-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:success-val is deprecated.  Use rll_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error_code-val :lambda-list '(m))
(cl:defmethod error_code-val ((m <MovePTPArmangle-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:error_code-val is deprecated.  Use rll_msgs-srv:error_code instead.")
  (error_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovePTPArmangle-response>) ostream)
  "Serializes a message object of type '<MovePTPArmangle-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'error_code)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovePTPArmangle-response>) istream)
  "Deserializes a message object of type '<MovePTPArmangle-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'error_code)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovePTPArmangle-response>)))
  "Returns string type for a service object of type '<MovePTPArmangle-response>"
  "rll_msgs/MovePTPArmangleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovePTPArmangle-response)))
  "Returns string type for a service object of type 'MovePTPArmangle-response"
  "rll_msgs/MovePTPArmangleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovePTPArmangle-response>)))
  "Returns md5sum for a message object of type '<MovePTPArmangle-response>"
  "120f4f54a5ecc4177ce4f86f46f94f5d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovePTPArmangle-response)))
  "Returns md5sum for a message object of type 'MovePTPArmangle-response"
  "120f4f54a5ecc4177ce4f86f46f94f5d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovePTPArmangle-response>)))
  "Returns full string definition for message of type '<MovePTPArmangle-response>"
  (cl:format cl:nil "bool success~%uint8 error_code~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovePTPArmangle-response)))
  "Returns full string definition for message of type 'MovePTPArmangle-response"
  (cl:format cl:nil "bool success~%uint8 error_code~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovePTPArmangle-response>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovePTPArmangle-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MovePTPArmangle-response
    (cl:cons ':success (success msg))
    (cl:cons ':error_code (error_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MovePTPArmangle)))
  'MovePTPArmangle-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MovePTPArmangle)))
  'MovePTPArmangle-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovePTPArmangle)))
  "Returns string type for a service object of type '<MovePTPArmangle>"
  "rll_msgs/MovePTPArmangle")