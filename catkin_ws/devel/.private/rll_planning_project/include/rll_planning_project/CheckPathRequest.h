// Generated by gencpp from file rll_planning_project/CheckPathRequest.msg
// DO NOT EDIT!


#ifndef RLL_PLANNING_PROJECT_MESSAGE_CHECKPATHREQUEST_H
#define RLL_PLANNING_PROJECT_MESSAGE_CHECKPATHREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Pose2D.h>
#include <geometry_msgs/Pose2D.h>

namespace rll_planning_project
{
template <class ContainerAllocator>
struct CheckPathRequest_
{
  typedef CheckPathRequest_<ContainerAllocator> Type;

  CheckPathRequest_()
    : pose_start()
    , pose_goal()  {
    }
  CheckPathRequest_(const ContainerAllocator& _alloc)
    : pose_start(_alloc)
    , pose_goal(_alloc)  {
  (void)_alloc;
    }



   typedef  ::geometry_msgs::Pose2D_<ContainerAllocator>  _pose_start_type;
  _pose_start_type pose_start;

   typedef  ::geometry_msgs::Pose2D_<ContainerAllocator>  _pose_goal_type;
  _pose_goal_type pose_goal;





  typedef boost::shared_ptr< ::rll_planning_project::CheckPathRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::rll_planning_project::CheckPathRequest_<ContainerAllocator> const> ConstPtr;

}; // struct CheckPathRequest_

typedef ::rll_planning_project::CheckPathRequest_<std::allocator<void> > CheckPathRequest;

typedef boost::shared_ptr< ::rll_planning_project::CheckPathRequest > CheckPathRequestPtr;
typedef boost::shared_ptr< ::rll_planning_project::CheckPathRequest const> CheckPathRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::rll_planning_project::CheckPathRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::rll_planning_project::CheckPathRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::rll_planning_project::CheckPathRequest_<ContainerAllocator1> & lhs, const ::rll_planning_project::CheckPathRequest_<ContainerAllocator2> & rhs)
{
  return lhs.pose_start == rhs.pose_start &&
    lhs.pose_goal == rhs.pose_goal;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::rll_planning_project::CheckPathRequest_<ContainerAllocator1> & lhs, const ::rll_planning_project::CheckPathRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace rll_planning_project

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::rll_planning_project::CheckPathRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::rll_planning_project::CheckPathRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rll_planning_project::CheckPathRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rll_planning_project::CheckPathRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rll_planning_project::CheckPathRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rll_planning_project::CheckPathRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::rll_planning_project::CheckPathRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a64bb936c67a976431689a78c534f6f5";
  }

  static const char* value(const ::rll_planning_project::CheckPathRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa64bb936c67a9764ULL;
  static const uint64_t static_value2 = 0x31689a78c534f6f5ULL;
};

template<class ContainerAllocator>
struct DataType< ::rll_planning_project::CheckPathRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "rll_planning_project/CheckPathRequest";
  }

  static const char* value(const ::rll_planning_project::CheckPathRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::rll_planning_project::CheckPathRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "geometry_msgs/Pose2D pose_start\n"
"geometry_msgs/Pose2D pose_goal\n"
"\n"
"================================================================================\n"
"MSG: geometry_msgs/Pose2D\n"
"# Deprecated\n"
"# Please use the full 3D pose.\n"
"\n"
"# In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.\n"
"\n"
"# If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.\n"
"\n"
"\n"
"# This expresses a position and orientation on a 2D manifold.\n"
"\n"
"float64 x\n"
"float64 y\n"
"float64 theta\n"
;
  }

  static const char* value(const ::rll_planning_project::CheckPathRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::rll_planning_project::CheckPathRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.pose_start);
      stream.next(m.pose_goal);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CheckPathRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::rll_planning_project::CheckPathRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::rll_planning_project::CheckPathRequest_<ContainerAllocator>& v)
  {
    s << indent << "pose_start: ";
    s << std::endl;
    Printer< ::geometry_msgs::Pose2D_<ContainerAllocator> >::stream(s, indent + "  ", v.pose_start);
    s << indent << "pose_goal: ";
    s << std::endl;
    Printer< ::geometry_msgs::Pose2D_<ContainerAllocator> >::stream(s, indent + "  ", v.pose_goal);
  }
};

} // namespace message_operations
} // namespace ros

#endif // RLL_PLANNING_PROJECT_MESSAGE_CHECKPATHREQUEST_H
