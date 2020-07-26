
"use strict";

let MoveRandom = require('./MoveRandom.js')
let MovePTP = require('./MovePTP.js')
let GetPose = require('./GetPose.js')
let PickPlace = require('./PickPlace.js')
let MoveJoints = require('./MoveJoints.js')
let MoveLinArmangle = require('./MoveLinArmangle.js')
let GetJointValues = require('./GetJointValues.js')
let MovePTPArmangle = require('./MovePTPArmangle.js')
let MoveLin = require('./MoveLin.js')

module.exports = {
  MoveRandom: MoveRandom,
  MovePTP: MovePTP,
  GetPose: GetPose,
  PickPlace: PickPlace,
  MoveJoints: MoveJoints,
  MoveLinArmangle: MoveLinArmangle,
  GetJointValues: GetJointValues,
  MovePTPArmangle: MovePTPArmangle,
  MoveLin: MoveLin,
};
