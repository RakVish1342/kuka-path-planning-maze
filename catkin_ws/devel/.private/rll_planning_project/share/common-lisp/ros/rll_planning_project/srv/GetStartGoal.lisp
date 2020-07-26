; Auto-generated. Do not edit!


(cl:in-package rll_planning_project-srv)


;//! \htmlinclude GetStartGoal-request.msg.html

(cl:defclass <GetStartGoal-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass GetStartGoal-request (<GetStartGoal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetStartGoal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetStartGoal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rll_planning_project-srv:<GetStartGoal-request> is deprecated: use rll_planning_project-srv:GetStartGoal-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetStartGoal-request>) ostream)
  "Serializes a message object of type '<GetStartGoal-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetStartGoal-request>) istream)
  "Deserializes a message object of type '<GetStartGoal-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetStartGoal-request>)))
  "Returns string type for a service object of type '<GetStartGoal-request>"
  "rll_planning_project/GetStartGoalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetStartGoal-request)))
  "Returns string type for a service object of type 'GetStartGoal-request"
  "rll_planning_project/GetStartGoalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetStartGoal-request>)))
  "Returns md5sum for a message object of type '<GetStartGoal-request>"
  "20f5244415b7ff944aeb9f4f84fb11ce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetStartGoal-request)))
  "Returns md5sum for a message object of type 'GetStartGoal-request"
  "20f5244415b7ff944aeb9f4f84fb11ce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetStartGoal-request>)))
  "Returns full string definition for message of type '<GetStartGoal-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetStartGoal-request)))
  "Returns full string definition for message of type 'GetStartGoal-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetStartGoal-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetStartGoal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GetStartGoal-request
))
;//! \htmlinclude GetStartGoal-response.msg.html

(cl:defclass <GetStartGoal-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil)
   (error_code
    :reader error_code
    :initarg :error_code
    :type cl:fixnum
    :initform 0)
   (start
    :reader start
    :initarg :start
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D))
   (goal
    :reader goal
    :initarg :goal
    :type geometry_msgs-msg:Pose2D
    :initform (cl:make-instance 'geometry_msgs-msg:Pose2D)))
)

(cl:defclass GetStartGoal-response (<GetStartGoal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GetStartGoal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GetStartGoal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rll_planning_project-srv:<GetStartGoal-response> is deprecated: use rll_planning_project-srv:GetStartGoal-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <GetStartGoal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_planning_project-srv:success-val is deprecated.  Use rll_planning_project-srv:success instead.")
  (success m))

(cl:ensure-generic-function 'error_code-val :lambda-list '(m))
(cl:defmethod error_code-val ((m <GetStartGoal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_planning_project-srv:error_code-val is deprecated.  Use rll_planning_project-srv:error_code instead.")
  (error_code m))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <GetStartGoal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_planning_project-srv:start-val is deprecated.  Use rll_planning_project-srv:start instead.")
  (start m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <GetStartGoal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader rll_planning_project-srv:goal-val is deprecated.  Use rll_planning_project-srv:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GetStartGoal-response>) ostream)
  "Serializes a message object of type '<GetStartGoal-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'error_code)) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'start) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'goal) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GetStartGoal-response>) istream)
  "Deserializes a message object of type '<GetStartGoal-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'error_code)) (cl:read-byte istream))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'start) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'goal) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GetStartGoal-response>)))
  "Returns string type for a service object of type '<GetStartGoal-response>"
  "rll_planning_project/GetStartGoalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetStartGoal-response)))
  "Returns string type for a service object of type 'GetStartGoal-response"
  "rll_planning_project/GetStartGoalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GetStartGoal-response>)))
  "Returns md5sum for a message object of type '<GetStartGoal-response>"
  "20f5244415b7ff944aeb9f4f84fb11ce")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GetStartGoal-response)))
  "Returns md5sum for a message object of type 'GetStartGoal-response"
  "20f5244415b7ff944aeb9f4f84fb11ce")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GetStartGoal-response>)))
  "Returns full string definition for message of type '<GetStartGoal-response>"
  (cl:format cl:nil "bool success~%uint8 error_code~%geometry_msgs/Pose2D start~%geometry_msgs/Pose2D goal~%~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GetStartGoal-response)))
  "Returns full string definition for message of type 'GetStartGoal-response"
  (cl:format cl:nil "bool success~%uint8 error_code~%geometry_msgs/Pose2D start~%geometry_msgs/Pose2D goal~%~%~%================================================================================~%MSG: geometry_msgs/Pose2D~%# Deprecated~%# Please use the full 3D pose.~%~%# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.~%~%# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.~%~%~%# This expresses a position and orientation on a 2D manifold.~%~%float64 x~%float64 y~%float64 theta~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GetStartGoal-response>))
  (cl:+ 0
     1
     1
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'start))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'goal))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GetStartGoal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GetStartGoal-response
    (cl:cons ':success (success msg))
    (cl:cons ':error_code (error_code msg))
    (cl:cons ':start (start msg))
    (cl:cons ':goal (goal msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GetStartGoal)))
  'GetStartGoal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GetStartGoal)))
  'GetStartGoal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GetStartGoal)))
  "Returns string type for a service object of type '<GetStartGoal>"
  "rll_planning_project/GetStartGoal")