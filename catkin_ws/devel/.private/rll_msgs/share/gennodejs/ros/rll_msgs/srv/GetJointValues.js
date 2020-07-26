// Auto-generated. Do not edit!

// (in-package rll_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class GetJointValuesRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetJointValuesRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetJointValuesRequest
    let len;
    let data = new GetJointValuesRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'rll_msgs/GetJointValuesRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetJointValuesRequest(null);
    return resolved;
    }
};

class GetJointValuesResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.error_code = null;
      this.joint_1 = null;
      this.joint_2 = null;
      this.joint_3 = null;
      this.joint_4 = null;
      this.joint_5 = null;
      this.joint_6 = null;
      this.joint_7 = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('error_code')) {
        this.error_code = initObj.error_code
      }
      else {
        this.error_code = 0;
      }
      if (initObj.hasOwnProperty('joint_1')) {
        this.joint_1 = initObj.joint_1
      }
      else {
        this.joint_1 = 0.0;
      }
      if (initObj.hasOwnProperty('joint_2')) {
        this.joint_2 = initObj.joint_2
      }
      else {
        this.joint_2 = 0.0;
      }
      if (initObj.hasOwnProperty('joint_3')) {
        this.joint_3 = initObj.joint_3
      }
      else {
        this.joint_3 = 0.0;
      }
      if (initObj.hasOwnProperty('joint_4')) {
        this.joint_4 = initObj.joint_4
      }
      else {
        this.joint_4 = 0.0;
      }
      if (initObj.hasOwnProperty('joint_5')) {
        this.joint_5 = initObj.joint_5
      }
      else {
        this.joint_5 = 0.0;
      }
      if (initObj.hasOwnProperty('joint_6')) {
        this.joint_6 = initObj.joint_6
      }
      else {
        this.joint_6 = 0.0;
      }
      if (initObj.hasOwnProperty('joint_7')) {
        this.joint_7 = initObj.joint_7
      }
      else {
        this.joint_7 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GetJointValuesResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [error_code]
    bufferOffset = _serializer.uint8(obj.error_code, buffer, bufferOffset);
    // Serialize message field [joint_1]
    bufferOffset = _serializer.float64(obj.joint_1, buffer, bufferOffset);
    // Serialize message field [joint_2]
    bufferOffset = _serializer.float64(obj.joint_2, buffer, bufferOffset);
    // Serialize message field [joint_3]
    bufferOffset = _serializer.float64(obj.joint_3, buffer, bufferOffset);
    // Serialize message field [joint_4]
    bufferOffset = _serializer.float64(obj.joint_4, buffer, bufferOffset);
    // Serialize message field [joint_5]
    bufferOffset = _serializer.float64(obj.joint_5, buffer, bufferOffset);
    // Serialize message field [joint_6]
    bufferOffset = _serializer.float64(obj.joint_6, buffer, bufferOffset);
    // Serialize message field [joint_7]
    bufferOffset = _serializer.float64(obj.joint_7, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GetJointValuesResponse
    let len;
    let data = new GetJointValuesResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [error_code]
    data.error_code = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [joint_1]
    data.joint_1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [joint_2]
    data.joint_2 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [joint_3]
    data.joint_3 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [joint_4]
    data.joint_4 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [joint_5]
    data.joint_5 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [joint_6]
    data.joint_6 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [joint_7]
    data.joint_7 = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 58;
  }

  static datatype() {
    // Returns string type for a service object
    return 'rll_msgs/GetJointValuesResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8e5a3555469b4e8d3327599e7f25c1a4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    uint8 error_code
    float64 joint_1
    float64 joint_2
    float64 joint_3
    float64 joint_4
    float64 joint_5
    float64 joint_6
    float64 joint_7
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GetJointValuesResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.error_code !== undefined) {
      resolved.error_code = msg.error_code;
    }
    else {
      resolved.error_code = 0
    }

    if (msg.joint_1 !== undefined) {
      resolved.joint_1 = msg.joint_1;
    }
    else {
      resolved.joint_1 = 0.0
    }

    if (msg.joint_2 !== undefined) {
      resolved.joint_2 = msg.joint_2;
    }
    else {
      resolved.joint_2 = 0.0
    }

    if (msg.joint_3 !== undefined) {
      resolved.joint_3 = msg.joint_3;
    }
    else {
      resolved.joint_3 = 0.0
    }

    if (msg.joint_4 !== undefined) {
      resolved.joint_4 = msg.joint_4;
    }
    else {
      resolved.joint_4 = 0.0
    }

    if (msg.joint_5 !== undefined) {
      resolved.joint_5 = msg.joint_5;
    }
    else {
      resolved.joint_5 = 0.0
    }

    if (msg.joint_6 !== undefined) {
      resolved.joint_6 = msg.joint_6;
    }
    else {
      resolved.joint_6 = 0.0
    }

    if (msg.joint_7 !== undefined) {
      resolved.joint_7 = msg.joint_7;
    }
    else {
      resolved.joint_7 = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: GetJointValuesRequest,
  Response: GetJointValuesResponse,
  md5sum() { return '8e5a3555469b4e8d3327599e7f25c1a4'; },
  datatype() { return 'rll_msgs/GetJointValues'; }
};
