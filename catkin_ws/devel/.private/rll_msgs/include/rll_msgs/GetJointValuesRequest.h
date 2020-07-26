// Generated by gencpp from file rll_msgs/GetJointValuesRequest.msg
// DO NOT EDIT!


#ifndef RLL_MSGS_MESSAGE_GETJOINTVALUESREQUEST_H
#define RLL_MSGS_MESSAGE_GETJOINTVALUESREQUEST_H


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
struct GetJointValuesRequest_
{
  typedef GetJointValuesRequest_<ContainerAllocator> Type;

  GetJointValuesRequest_()
    {
    }
  GetJointValuesRequest_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::rll_msgs::GetJointValuesRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::rll_msgs::GetJointValuesRequest_<ContainerAllocator> const> ConstPtr;

}; // struct GetJointValuesRequest_

typedef ::rll_msgs::GetJointValuesRequest_<std::allocator<void> > GetJointValuesRequest;

typedef boost::shared_ptr< ::rll_msgs::GetJointValuesRequest > GetJointValuesRequestPtr;
typedef boost::shared_ptr< ::rll_msgs::GetJointValuesRequest const> GetJointValuesRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::rll_msgs::GetJointValuesRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::rll_msgs::GetJointValuesRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


} // namespace rll_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::rll_msgs::GetJointValuesRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::rll_msgs::GetJointValuesRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rll_msgs::GetJointValuesRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::rll_msgs::GetJointValuesRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rll_msgs::GetJointValuesRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::rll_msgs::GetJointValuesRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::rll_msgs::GetJointValuesRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::rll_msgs::GetJointValuesRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::rll_msgs::GetJointValuesRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "rll_msgs/GetJointValuesRequest";
  }

  static const char* value(const ::rll_msgs::GetJointValuesRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::rll_msgs::GetJointValuesRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
;
  }

  static const char* value(const ::rll_msgs::GetJointValuesRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::rll_msgs::GetJointValuesRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct GetJointValuesRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::rll_msgs::GetJointValuesRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::rll_msgs::GetJointValuesRequest_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // RLL_MSGS_MESSAGE_GETJOINTVALUESREQUEST_H
