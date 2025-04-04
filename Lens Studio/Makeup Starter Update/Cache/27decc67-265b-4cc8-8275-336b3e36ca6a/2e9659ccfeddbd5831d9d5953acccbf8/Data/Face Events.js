// FaceEvents.js
// Version 0.0.2
//
// Provides face events as a block for AI Lens Creator

//@input bool enableHint = true;
//@input float headTiltThresholdAngle = 10 {"widget" : "slider", "min" : 0, "max" : 35, "step" : 0.1}
//@input Asset.ObjectPrefab headPrefab;
const eventModule = require("./HintEventsModule102.js");

let hints = [];
const hintDuration = 3;
const hintDelay = 0.5;
// Head tilt vars
let headTiltThresholdAngle = script.headTiltThresholdAngle;
let headTiltThreshold;
let head;
let HeadState = { "NONE": 0, "LEFT": 1, "RIGHT": 2 };
let currentHeadState = HeadState.NONE;
let eps = 20.0;
let initValue = new vec2(0.5,0.5);
const scriptSO = script.getSceneObject();
// Public vars where positions are vec2 in screenspace (0-1.0,0-1.0)
let publicVars = {
    headAngle:initValue,
    leftEyePosition2D:initValue,
    rightEyePosition2D:initValue,
    nosePosition2D:initValue,
    mouthPosition2D:initValue,
    headCenterPosition2D:initValue,
    foreheadPosition2D:initValue
};

const events = [
    ["onFaceFound", "FaceFoundEvent","lens_hint_find_face"],
    ["onFaceLost", "FaceLostEvent","lens_hint_find_face"],
    ["onMouthOpened","MouthOpenedEvent","lens_hint_open_your_mouth"],
    ["onMouthClosed","MouthClosedEvent","lens_hint_open_your_mouth"],
    ["onSmileStarted","SmileStartedEvent","lens_hint_smile"],
    ["onSmileFinished","SmileFinishedEvent","lens_hint_smile"],
    ["onKissStarted","KissStartedEvent","lens_hint_blow_a_kiss"],
    ["onKissFinished","KissFinishedEvent","lens_hint_blow_a_kiss"],
    ["onBrowsRaised","BrowsRaisedEvent","lens_hint_raise_your_eyebrows"],
    ["onBrowsLowered","BrowsLoweredEvent","lens_hint_raise_your_eyebrows"],
    ["onBrowsNormal","BrowsReturnedToNormalEvent","lens_hint_raise_your_eyebrows"],
    ["onTiltLeft","","lens_hint_tilt_your_head"],
    ["onTiltCenter","",""],
    ["onTiltRight","","lens_hint_tilt_your_head"]
];

function init(){
    for (const i in events) {
        registerEvent(events[i][0], events[i][1], events[i][2]);
    }
    if(script.enableHint){
        showHints();
    }
    headTiltSetup();
    createGetterFunctions(publicVars, script);
}

function registerEvent(name,builtinName,hintName) {
    script[name] = new eventModule.EventWrapper(addHint(hintName));
    if(builtinName){
        script.createEvent(builtinName).bind(function(data) {
            script[name].trigger();
        });
    }
}

function headTiltSetup(){
    head = script.headPrefab.instantiate(scriptSO);
    head = head.getComponent("Component.Head");
    headTiltThreshold = Math.abs(Math.sin(headTiltThresholdAngle / 180 * Math.PI))*100;
    script.createEvent("UpdateEvent").bind(trackHead);
}

function trackHead() {
    if(head.getFacesCount() === 0){
        return;
    }
    let headTransform = head.getTransform();
    publicVars.headAngle = headTransform.up.x*100;
    publicVars.nosePosition2D = head.getLandmark(30);
    publicVars.leftEyePosition2D = head.getLandmark(84);
    publicVars.rightEyePosition2D = head.getLandmark(75);
    publicVars.mouthPosition2D = head.getLandmark(62);
    publicVars.headCenterPosition2D = head.getLandmark(29);
    publicVars.foreheadPosition2D = head.getLandmark(27);
    if (Math.abs(publicVars.headAngle) < eps) {
        if (currentHeadState != HeadState.NONE) {
            currentHeadState = HeadState.NONE;
            script["onTiltCenter"].trigger();
        }
    }
    else if (publicVars.headAngle < -headTiltThreshold) {
        if (currentHeadState != HeadState.LEFT) {
            currentHeadState = HeadState.LEFT;
            script["onTiltLeft"].trigger();
        }
    } else if (publicVars.headAngle > headTiltThreshold) {
        if (currentHeadState != HeadState.RIGHT) {
            currentHeadState = HeadState.RIGHT;
            script["onTiltRight"].trigger();
        }
    }

}


function addHint(name){
    return () => {
        // Adds all unique hints to array
        if(!hints.includes(name)){
            hints.push(name);
        }        
    }
}

function showHints(){
    let dcb = script.createEvent("DelayedCallbackEvent");
    // Outer delay callback waits for hint binding at start of lens
    dcb.bind(function(){
        for(item in hints){
            // Starts first loo
            let delay = hintDuration*item;
            let hint = hints[item];
            // Inner delay callback shows all bound hints in sequence
            let hintDcb = script.createEvent("DelayedCallbackEvent");
            hintDcb.bind(function(){
                // Shows a hint using the internal hint component.
                let hc = scriptSO.createComponent("Component.HintsComponent");  
                hc.showHint(hint,hintDuration);
            });
            hintDcb.reset(delay);
        }
    });
    dcb.reset(hintDelay);
}

function createGetterFunctions(vars, target) {
    Object.keys(vars).forEach(key => {
        target[`get${capitalizeFirstLetter(key)}`] = function() {
            return vars[key];
        };
    });
}

function capitalizeFirstLetter(string) {
    return string.charAt(0).toUpperCase() + string.slice(1);
}





init();


