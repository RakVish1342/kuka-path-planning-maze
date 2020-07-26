; Auto-generated. Do not edit!


(cl:in-package rll_msgs-srv)


;//! \htmlinclude MoveLin-request.msg.html

(cl:defclass <MoveLin-request> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass MoveLin-request (<MoveLin-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveLin-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveLin-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rll_msgs-srv:<MoveLin-request> is deprecated: use rll_msgs-srv:MoveLin-request instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <MoveLin-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:pose-val is deprecated.  Use rll_msgs-srv:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveLin-request>) ostream)
  "Serializes a message object of type '<MoveLin-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveLin-request>) istream)
  "Deserializes a message object of type '<MoveLin-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveLin-request>)))
  "Returns string type for a service object of type '<MoveLin-request>"
  "rll_msgs/MoveLinRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveLin-request)))
  "Returns string type for a service object of type 'MoveLin-request"
  "rll_msgs/MoveLinRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveLin-request>)))
  "Returns md5sum for a message object of type '<MoveLin-request>"
  "906eaa149aa69bf11e4f5f1c416e3b33")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveLin-request)))
  "Returns md5sum for a message object of type 'MoveLin-request"
  "906eaa149aa69bf11e4f5f1c416e3b33")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveLin-request>)))
  "Returns full string definition for message of type '<MoveLin-request>"
  (cl:format cl:nil "geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveLin-request)))
  "Returns full string definition for message of type 'MoveLin-request"
  (cl:format cl:nil "geometry_msgs/Pose pose~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveLin-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveLin-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveLin-request
    (cl:cons ':pose (pose msg))
))
;//! \htmlinclude MoveLin-response.msg.html

(cl:defclass <MoveLin-response> (roslisp-msg-protocol:ros-message)
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

(cl:defclass MoveLin-response (<MoveLin-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveLin-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveLin-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rll_msgs-srv:<MoveLin-response> is deprecated: use rll_msgs-srv:MoveLin-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MoveLin-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:success-val is deprecated.  Use rll_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error_code-val :lambda-list '(m))
(cl:defmethod error_code-val ((m <MoveLin-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:error_code-val is deprecated.  Use rll_msgs-srv:error_code instead.")
  (error_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveLin-response>) ostream)
  "Serializes a message object of type '<MoveLin-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'error_code)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveLin-response>) istream)
  "Deserializes a message object of type '<MoveLin-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'error_code)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveLin-response>)))
  "Returns string type for a service object of type '<MoveLin-response>"
  "rll_msgs/MoveLinResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveLin-response)))
  "Returns string type for a service object of type 'MoveLin-response"
  "rll_msgs/MoveLinResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveLin-response>)))
  "Returns md5sum for a message object of type '<MoveLin-response>"
  "906eaa149aa69bf11e4f5f1c416e3b33")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveLin-response)))
  "Returns md5sum for a message object of type 'MoveLin-response"
  "906eaa149aa69bf11e4f5f1c416e3b33")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveLin-response>)))
  "Returns full string definition for message of type '<MoveLin-response>"
  (cl:format cl:nil "bool success~%uint8 error_code~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveLin-response)))
  "Returns full string definition for message of type 'MoveLin-response"
  (cl:format cl:nil "bool success~%uint8 error_code~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveLin-response>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveLin-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveLin-response
    (cl:cons ':success (success msg))
    (cl:cons ':error_code (error_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveLin)))
  'MoveLin-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveLin)))
  'MoveLin-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveLin)))
  "Returns string type for a service object of type '<MoveLin>"
  "rll_msgs/MoveLin")