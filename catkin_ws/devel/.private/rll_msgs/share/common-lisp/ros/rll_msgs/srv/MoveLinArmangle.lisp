; Auto-generated. Do not edit!


(cl:in-package rll_msgs-srv)


;//! \htmlinclude MoveLinArmangle-request.msg.html

(cl:defclass <MoveLinArmangle-request> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (arm_angle
    :reader arm_angle
    :initarg :arm_angle
    :type cl:float
    :initform 0.0)
   (direction
    :reader direction
    :initarg :direction
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass MoveLinArmangle-request (<MoveLinArmangle-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveLinArmangle-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveLinArmangle-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rll_msgs-srv:<MoveLinArmangle-request> is deprecated: use rll_msgs-srv:MoveLinArmangle-request instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <MoveLinArmangle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:pose-val is deprecated.  Use rll_msgs-srv:pose instead.")
  (pose m))

(cl:ensure-generic-function 'arm_angle-val :lambda-list '(m))
(cl:defmethod arm_angle-val ((m <MoveLinArmangle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:arm_angle-val is deprecated.  Use rll_msgs-srv:arm_angle instead.")
  (arm_angle m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <MoveLinArmangle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:direction-val is deprecated.  Use rll_msgs-srv:direction instead.")
  (direction m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveLinArmangle-request>) ostream)
  "Serializes a message object of type '<MoveLinArmangle-request>"
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
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'direction) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveLinArmangle-request>) istream)
  "Deserializes a message object of type '<MoveLinArmangle-request>"
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
    (cl:setf (cl:slot-value msg 'direction) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveLinArmangle-request>)))
  "Returns string type for a service object of type '<MoveLinArmangle-request>"
  "rll_msgs/MoveLinArmangleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveLinArmangle-request)))
  "Returns string type for a service object of type 'MoveLinArmangle-request"
  "rll_msgs/MoveLinArmangleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveLinArmangle-request>)))
  "Returns md5sum for a message object of type '<MoveLinArmangle-request>"
  "74e55c617279aa58663455a6351ca165")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveLinArmangle-request)))
  "Returns md5sum for a message object of type 'MoveLinArmangle-request"
  "74e55c617279aa58663455a6351ca165")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveLinArmangle-request>)))
  "Returns full string definition for message of type '<MoveLinArmangle-request>"
  (cl:format cl:nil "geometry_msgs/Pose pose~%float64 arm_angle~%bool direction~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveLinArmangle-request)))
  "Returns full string definition for message of type 'MoveLinArmangle-request"
  (cl:format cl:nil "geometry_msgs/Pose pose~%float64 arm_angle~%bool direction~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveLinArmangle-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveLinArmangle-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveLinArmangle-request
    (cl:cons ':pose (pose msg))
    (cl:cons ':arm_angle (arm_angle msg))
    (cl:cons ':direction (direction msg))
))
;//! \htmlinclude MoveLinArmangle-response.msg.html

(cl:defclass <MoveLinArmangle-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass MoveLinArmangle-response (<MoveLinArmangle-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveLinArmangle-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveLinArmangle-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rll_msgs-srv:<MoveLinArmangle-response> is deprecated: use rll_msgs-srv:MoveLinArmangle-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MoveLinArmangle-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:success-val is deprecated.  Use rll_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error_code-val :lambda-list '(m))
(cl:defmethod error_code-val ((m <MoveLinArmangle-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:error_code-val is deprecated.  Use rll_msgs-srv:error_code instead.")
  (error_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveLinArmangle-response>) ostream)
  "Serializes a message object of type '<MoveLinArmangle-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'error_code)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveLinArmangle-response>) istream)
  "Deserializes a message object of type '<MoveLinArmangle-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'error_code)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveLinArmangle-response>)))
  "Returns string type for a service object of type '<MoveLinArmangle-response>"
  "rll_msgs/MoveLinArmangleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveLinArmangle-response)))
  "Returns string type for a service object of type 'MoveLinArmangle-response"
  "rll_msgs/MoveLinArmangleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveLinArmangle-response>)))
  "Returns md5sum for a message object of type '<MoveLinArmangle-response>"
  "74e55c617279aa58663455a6351ca165")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveLinArmangle-response)))
  "Returns md5sum for a message object of type 'MoveLinArmangle-response"
  "74e55c617279aa58663455a6351ca165")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveLinArmangle-response>)))
  "Returns full string definition for message of type '<MoveLinArmangle-response>"
  (cl:format cl:nil "bool success~%uint8 error_code~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveLinArmangle-response)))
  "Returns full string definition for message of type 'MoveLinArmangle-response"
  (cl:format cl:nil "bool success~%uint8 error_code~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveLinArmangle-response>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveLinArmangle-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveLinArmangle-response
    (cl:cons ':success (success msg))
    (cl:cons ':error_code (error_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveLinArmangle)))
  'MoveLinArmangle-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveLinArmangle)))
  'MoveLinArmangle-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveLinArmangle)))
  "Returns string type for a service object of type '<MoveLinArmangle>"
  "rll_msgs/MoveLinArmangle")