;; Auto-generated. Do not edit!


(when (boundp 'rll_planning_project::PlanToGoalAction)
  (if (not (find-package "RLL_PLANNING_PROJECT"))
    (make-package "RLL_PLANNING_PROJECT"))
  (shadow 'PlanToGoalAction (find-package "RLL_PLANNING_PROJECT")))
(unless (find-package "RLL_PLANNING_PROJECT::PLANTOGOALACTION")
  (make-package "RLL_PLANNING_PROJECT::PLANTOGOALACTION"))

(in-package "ROS")
;;//! \htmlinclude PlanToGoalAction.msg.html


(defclass rll_planning_project::PlanToGoalAction
  :super ros::object
  :slots (_action_goal _action_result _action_feedback ))

(defmethod rll_planning_project::PlanToGoalAction
  (:init
   (&key
    ((:action_goal __action_goal) (instance rll_planning_project::PlanToGoalActionGoal :init))
    ((:action_result __action_result) (instance rll_planning_project::PlanToGoalActionResult :init))
    ((:action_feedback __action_feedback) (instance rll_planning_project::PlanToGoalActionFeedback :init))
    )
   (send-super :init)
   (setq _action_goal __action_goal)
   (setq _action_result __action_result)
   (setq _action_feedback __action_feedback)
   self)
  (:action_goal
   (&rest __action_goal)
   (if (keywordp (car __action_goal))
       (send* _action_goal __action_goal)
     (progn
       (if __action_goal (setq _action_goal (car __action_goal)))
       _action_goal)))
  (:action_result
   (&rest __action_result)
   (if (keywordp (car __action_result))
       (send* _action_result __action_result)
     (progn
       (if __action_result (setq _action_result (car __action_result)))
       _action_result)))
  (:action_feedback
   (&rest __action_feedback)
   (if (keywordp (car __action_feedback))
       (send* _action_feedback __action_feedback)
     (progn
       (if __action_feedback (setq _action_feedback (car __action_feedback)))
       _action_feedback)))
  (:serialization-length
   ()
   (+
    ;; rll_planning_project/PlanToGoalActionGoal _action_goal
    (send _action_goal :serialization-length)
    ;; rll_planning_project/PlanToGoalActionResult _action_result
    (send _action_result :serialization-length)
    ;; rll_planning_project/PlanToGoalActionFeedback _action_feedback
    (send _action_feedback :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; rll_planning_project/PlanToGoalActionGoal _action_goal
       (send _action_goal :serialize s)
     ;; rll_planning_project/PlanToGoalActionResult _action_result
       (send _action_result :serialize s)
     ;; rll_planning_project/PlanToGoalActionFeedback _action_feedback
       (send _action_feedback :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; rll_planning_project/PlanToGoalActionGoal _action_goal
     (send _action_goal :deserialize buf ptr-) (incf ptr- (send _action_goal :serialization-length))
   ;; rll_planning_project/PlanToGoalActionResult _action_result
     (send _action_result :deserialize buf ptr-) (incf ptr- (send _action_result :serialization-length))
   ;; rll_planning_project/PlanToGoalActionFeedback _action_feedback
     (send _action_feedback :deserialize buf ptr-) (incf ptr- (send _action_feedback :serialization-length))
   ;;
   self)
  )

(setf (get rll_planning_project::PlanToGoalAction :md5sum-) "566ec93a7df22573c252ad5696d4cd0e")
(setf (get rll_planning_project::PlanToGoalAction :datatype-) "rll_planning_project/PlanToGoalAction")
(setf (get rll_planning_project::PlanToGoalAction :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======

PlanToGoalActionGoal action_goal
PlanToGoalActionResult action_result
PlanToGoalActionFeedback action_feedback

================================================================================
MSG: rll_planning_project/PlanToGoalActionGoal
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======

Header header
actionlib_msgs/GoalID goal_id
PlanToGoalGoal goal

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: actionlib_msgs/GoalID
# The stamp should store the time at which this goal was requested.
# It is used by an action server when it tries to preempt all
# goals that were requested before a certain time
time stamp

# The id provides a way to associate feedback and
# result message with specific goal requests. The id
# specified must be unique.
string id


================================================================================
MSG: rll_planning_project/PlanToGoalGoal
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
geometry_msgs/Pose2D start
geometry_msgs/Pose2D goal

================================================================================
MSG: geometry_msgs/Pose2D
# Deprecated
# Please use the full 3D pose.

# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.

# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.


# This expresses a position and orientation on a 2D manifold.

float64 x
float64 y
float64 theta

================================================================================
MSG: rll_planning_project/PlanToGoalActionResult
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======

Header header
actionlib_msgs/GoalStatus status
PlanToGoalResult result

================================================================================
MSG: actionlib_msgs/GoalStatus
GoalID goal_id
uint8 status
uint8 PENDING         = 0   # The goal has yet to be processed by the action server
uint8 ACTIVE          = 1   # The goal is currently being processed by the action server
uint8 PREEMPTED       = 2   # The goal received a cancel request after it started executing
                            #   and has since completed its execution (Terminal State)
uint8 SUCCEEDED       = 3   # The goal was achieved successfully by the action server (Terminal State)
uint8 ABORTED         = 4   # The goal was aborted during execution by the action server due
                            #    to some failure (Terminal State)
uint8 REJECTED        = 5   # The goal was rejected by the action server without being processed,
                            #    because the goal was unattainable or invalid (Terminal State)
uint8 PREEMPTING      = 6   # The goal received a cancel request after it started executing
                            #    and has not yet completed execution
uint8 RECALLING       = 7   # The goal received a cancel request before it started executing,
                            #    but the action server has not yet confirmed that the goal is canceled
uint8 RECALLED        = 8   # The goal received a cancel request before it started executing
                            #    and was successfully cancelled (Terminal State)
uint8 LOST            = 9   # An action client can determine that a goal is LOST. This should not be
                            #    sent over the wire by an action server

#Allow for the user to associate a string with GoalStatus for debugging
string text


================================================================================
MSG: rll_planning_project/PlanToGoalResult
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======

================================================================================
MSG: rll_planning_project/PlanToGoalActionFeedback
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======

Header header
actionlib_msgs/GoalStatus status
PlanToGoalFeedback feedback

================================================================================
MSG: rll_planning_project/PlanToGoalFeedback
# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======


")



(provide :rll_planning_project/PlanToGoalAction "566ec93a7df22573c252ad5696d4cd0e")

