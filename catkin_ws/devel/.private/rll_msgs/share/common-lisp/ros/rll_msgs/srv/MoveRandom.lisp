; Auto-generated. Do not edit!


(cl:in-package rll_msgs-srv)


;//! \htmlinclude MoveRandom-request.msg.html

(cl:defclass <MoveRandom-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass MoveRandom-request (<MoveRandom-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveRandom-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveRandom-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rll_msgs-srv:<MoveRandom-request> is deprecated: use rll_msgs-srv:MoveRandom-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveRandom-request>) ostream)
  "Serializes a message object of type '<MoveRandom-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveRandom-request>) istream)
  "Deserializes a message object of type '<MoveRandom-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveRandom-request>)))
  "Returns string type for a service object of type '<MoveRandom-request>"
  "rll_msgs/MoveRandomRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveRandom-request)))
  "Returns string type for a service object of type 'MoveRandom-request"
  "rll_msgs/MoveRandomRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveRandom-request>)))
  "Returns md5sum for a message object of type '<MoveRandom-request>"
  "b292fbfae6ae3594727e822d1d4ce5a2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveRandom-request)))
  "Returns md5sum for a message object of type 'MoveRandom-request"
  "b292fbfae6ae3594727e822d1d4ce5a2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveRandom-request>)))
  "Returns full string definition for message of type '<MoveRandom-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveRandom-request)))
  "Returns full string definition for message of type 'MoveRandom-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveRandom-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveRandom-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveRandom-request
))
;//! \htmlinclude MoveRandom-response.msg.html

(cl:defclass <MoveRandom-response> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (success
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

(cl:defclass MoveRandom-response (<MoveRandom-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveRandom-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveRandom-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rll_msgs-srv:<MoveRandom-response> is deprecated: use rll_msgs-srv:MoveRandom-response instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <MoveRandom-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:pose-val is deprecated.  Use rll_msgs-srv:pose instead.")
  (pose m))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <MoveRandom-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:success-val is deprecated.  Use rll_msgs-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error_code-val :lambda-list '(m))
(cl:defmethod error_code-val ((m <MoveRandom-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_msgs-srv:error_code-val is deprecated.  Use rll_msgs-srv:error_code instead.")
  (error_code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveRandom-response>) ostream)
  "Serializes a message object of type '<MoveRandom-response>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'error_code)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveRandom-response>) istream)
  "Deserializes a message object of type '<MoveRandom-response>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'error_code)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveRandom-response>)))
  "Returns string type for a service object of type '<MoveRandom-response>"
  "rll_msgs/MoveRandomResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveRandom-response)))
  "Returns string type for a service object of type 'MoveRandom-response"
  "rll_msgs/MoveRandomResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveRandom-response>)))
  "Returns md5sum for a message object of type '<MoveRandom-response>"
  "b292fbfae6ae3594727e822d1d4ce5a2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveRandom-response)))
  "Returns md5sum for a message object of type 'MoveRandom-response"
  "b292fbfae6ae3594727e822d1d4ce5a2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveRandom-response>)))
  "Returns full string definition for message of type '<MoveRandom-response>"
  (cl:format cl:nil "geometry_msgs/Pose pose~%bool success~%uint8 error_code~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveRandom-response)))
  "Returns full string definition for message of type 'MoveRandom-response"
  (cl:format cl:nil "geometry_msgs/Pose pose~%bool success~%uint8 error_code~%~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveRandom-response>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveRandom-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveRandom-response
    (cl:cons ':pose (pose msg))
    (cl:cons ':success (success msg))
    (cl:cons ':error_code (error_code msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MoveRandom)))
  'MoveRandom-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MoveRandom)))
  'MoveRandom-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveRandom)))
  "Returns string type for a service object of type '<MoveRandom>"
  "rll_msgs/MoveRandom")