; Auto-generated. Do not edit!


(cl:in-package rll_msgs-msg)


;//! \htmlinclude JobEnvGoal.msg.html

(cl:defclass <JobEnvGoal> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass JobEnvGoal (<JobEnvGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JobEnvGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JobEnvGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name rll_msgs-msg:<JobEnvGoal> is deprecated: use rll_msgs-msg:JobEnvGoal instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JobEnvGoal>) ostream)
  "Serializes a message object of type '<JobEnvGoal>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JobEnvGoal>) istream)
  "Deserializes a message object of type '<JobEnvGoal>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JobEnvGoal>)))
  "Returns string type for a message object of type '<JobEnvGoal>"
  "rll_msgs/JobEnvGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JobEnvGoal)))
  "Returns string type for a message object of type 'JobEnvGoal"
  "rll_msgs/JobEnvGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JobEnvGoal>)))
  "Returns md5sum for a message object of type '<JobEnvGoal>"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JobEnvGoal)))
  "Returns md5sum for a message object of type 'JobEnvGoal"
  "d41d8cd98f00b204e9800998ecf8427e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JobEnvGoal>)))
  "Returns full string definition for message of type '<JobEnvGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JobEnvGoal)))
  "Returns full string definition for message of type 'JobEnvGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JobEnvGoal>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JobEnvGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'JobEnvGoal
))
