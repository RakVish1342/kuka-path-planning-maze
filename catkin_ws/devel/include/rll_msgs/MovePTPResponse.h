// Generated by gencpp from file rll_msgs/MovePTPResponse.msg
// DO NOT EDIT!


#ifndef RLL_MSGS_MESSAGE_MOVEPTPRESPONSE_H
#define RLL_MSGS_MESSAGE_MOVEPTPRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace rll_msgs
{
template <class ContainerAllocator>
struct MovePTPResponse_
{
  typedef MovePTPResponse_<ContainerAllocator> Type;

  MovePTPResponse_()
    : success(false)  {
    }
  MovePTPResponse_(const ContainerAllocator& _alloc)
    : success(false)  {
  (void)_alloc;
    }



   typedef uint8_t _success_type;
  _success_type success;





  typedef boost::shared_ptr< ::rll_msgs::MovePTPResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::rll_msgs::MovePTPResponse_<ContainerAllocator> const> ConstPtr;

}; // struct MovePTPResponse_

typedef ::rll_msgs::MovePTPResponse_<std::allocator<void> > MovePTPResponse;

typedef boost::shared_ptr< ::rll_msgs::MovePTPResponse > MovePTPResponsePtr;
typedef boost::shared_ptr< ::rll_msgs::MovePTPResponse const> MovePTPResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::rll_msgs::MovePTPResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::rll_msgs::MovePTPResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace rll_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'actionlib_msgs': ['/opt/ros/kinetic/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'rll_msgs': ['/home/robond/Documents/rakshith/ASU/summer2020/kukaBlockChallenge/home/catkin_ws/src/rll_sdk/rll_msgs/msg', '/home/robond/Documents/rakshith/ASU/summer2020/kukaBlockChallenge/home/catkin_ws/devel/share/rll_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::rll_msgs::MovePTPResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::rll_msgs::MovePTPResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rll_msgs::MovePTPResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rll_msgs::MovePTPResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rll_msgs::MovePTPResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rll_msgs::MovePTPResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::rll_msgs::MovePTPResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "358e233cde0c8a8bcfea4ce193f8fc15";
  }

  static const char* value(const ::rll_msgs::MovePTPResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x358e233cde0c8a8bULL;
  static const uint64_t static_value2 = 0xcfea4ce193f8fc15ULL;
};

template<class ContainerAllocator>
struct DataType< ::rll_msgs::MovePTPResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "rll_msgs/MovePTPResponse";
  }

  static const char* value(const ::rll_msgs::MovePTPResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::rll_msgs::MovePTPResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "bool success\n\
\n\
";
  }

  static const char* value(const ::rll_msgs::MovePTPResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::rll_msgs::MovePTPResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.success);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MovePTPResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::rll_msgs::MovePTPResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::rll_msgs::MovePTPResponse_<ContainerAllocator>& v)
  {
    s << indent << "success: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.success);
  }
};

} // namespace message_operations
} // namespace ros

#endif // RLL_MSGS_MESSAGE_MOVEPTPRESPONSE_H
