// FacialFeaturesSegmentation.js
// Version: 1.0.0
// Event: OnStart
// Description: ML model that takes user's face as input, and outputs
//              7 different mask textures that can be used for advanced
//              face effects.

// Multi-face support, by default turned off.
//@input Asset.Texture faceCropTexture0;
//@input Asset.Texture faceCropTexture1;
// face index for which face to send to ml model
//@input int faceIndex;

// public variables that are not visible to the end user
//@input Asset.MLAsset model;
//@input Asset.Material material;

// public variables that are visible to the end user
// checkboxes for which face elements to parse
//@ui {"widget":"group_start", "label":"Face Parsing Elements"}
//@input bool backgr;
//@input bool beard;
//@input bool brows;
//@input bool ears;
//@input bool eyes;
//@input bool face_skin;
//@input bool lips;
//@ui {"widget":"group_end"}
//@ui {"widget":"separator"}
// boolean to invert mask
//@input bool invertMask;

// private variables
// ml component
if (!global._faceSegmentationHelpers) {
    global._faceSegmentationHelpers = new Array(2);
}
// ml parameters
var ML_ASSET_PARAMS = {
    INPUT_NAME: "data",
    OUTPUT_NAMES: ["backgr", "beard", "brows", "ears", "eyes", "face_skin", "lips"],
    INPUT_SHAPE: new vec3(96, 120, 3),
    OUTPUT_SHAPE: new vec3(96, 120, 1)
};
var index = script.faceIndex;
// image component
var imageComp;
// reference to the scene object that this script is attached to
var so = script.getSceneObject();

// local reference to public material (which will be hidden to the end user)
var material = script.material.clone();
//init material - ground truth for settings
for (var i = 0; i < ML_ASSET_PARAMS.OUTPUT_NAMES.length; i++) {
    material.mainPass[ML_ASSET_PARAMS.OUTPUT_NAMES[i] + "Enabled"] = script[ML_ASSET_PARAMS.OUTPUT_NAMES[i]];
}
// ml input/output stuff
var inputPlaceholder;
var outputPlaceholders = [];
// components for the output of the ml model
var rectangleSetterComponent;
var screenTransformComponent;
var mlComponent;

// import modules
var DestructionHelper = require("./DestructionHelper");
var manager = new DestructionHelper(script);

function init() {
    // Get Screen Transform Component
    screenTransformComponent = so.getComponent("Component.ScreenTransform");
    if (!screenTransformComponent) {
        print("Warning, please add this component to Screen Image");
    }
    if (screenTransformComponent && !screenTransformComponent.isInScreenHierarchy()) {
        print("Warning, scene object should be a part of screen hierarchy, please create Screen Image and attach this component");
    }
    // Create rectangle setter
    rectangleSetterComponent = manager.createComponent(so, "Component.RectangleSetter");
    rectangleSetterComponent.cropTexture = getFaceCropTexture();
    //check if ml component for this face index exists already
    if (global._faceSegmentationHelpers[index] == undefined) {
//        print("creating new ml component for the head " + script.faceIndex)
        var globalSo = global.scene.createSceneObject("FaceSegmentationMLComponent" + index);
        mlComponent = globalSo.createComponent('MLComponent')
        global._faceSegmentationHelpers[index] = {
            sceneObject: globalSo,
            mlComponent: mlComponent,
            count: 1
        }
        configureMLComponent(mlComponent);
    } else {
        //print("usind existing ml component for head " + script.faceIndex)
        mlComponent = global._faceSegmentationHelpers[index].mlComponent;
        //add check here maybe it was built already but not running yet
        //print("Model STate  " + global._faceSegmentationHelpers[index].mlComponent.state);
        global._faceSegmentationHelpers[index].count += 1;
        // if(mlComponent.state == MachineLearning.ModelState.IDLE) {
        //     onLoaded();
        // }
    }
    // On Running Finished callback
    mlComponent.onRunningFinished = manager.safeCallback(onRunningFinished);
}

function configureMLComponent(mlComponent) {
    // setup mlComponent
    mlComponent.model = script.model;
    // build ml component
    inputPlaceholder = mlComponent.getInputs()[0];
    outputPlaceholders = mlComponent.getOutputs();
    for (var i = 0; i < mlComponent.getOutputs().length; i++) {
        outputPlaceholders[i].mode = MachineLearning.OutputMode.Texture;
    }
    mlComponent.build([]);
    // On Loading Finished callback 
    mlComponent.onLoadingFinished = manager.safeCallback(onLoaded);
}

function onLoaded() {
//    print("loaded")
    // Set input for ML Component
    inputPlaceholder.texture = getFaceCropTexture();
    mlComponent.runScheduled(true, MachineLearning.FrameTiming.Update, MachineLearning.FrameTiming.Update);
    // // Apply output textures to image components
    //
    // run ml component
        if (script.invertMask == true) {
            material.mainPass.invert = true;
        }
        else {
            material.mainPass.invert = false;
        }
}

function onRunningFinished() {
    if (!isNull(imageComp)) {
        return;
    }
//    print("init image");

    imageComp = manager.createComponent(so, "Component.Image");
    imageComp.mainMaterial = material;
    for (var i = 0; i < ML_ASSET_PARAMS.OUTPUT_NAMES.length; i++) {
        material.mainPass[ML_ASSET_PARAMS.OUTPUT_NAMES[i] + "Mask"] = mlComponent.getOutput(ML_ASSET_PARAMS.OUTPUT_NAMES[i]).texture;
    }
}

// returns either face crop texture depending on if faceIndex is set to 0 or 1
function getFaceCropTexture() {
    return script.faceIndex == 1 ? script.faceCropTexture1 : script.faceCropTexture0;
}

function onDestroy() {
    if (global._faceSegmentationHelpers[index]) {
        global._faceSegmentationHelpers[index].count -= 0;
        if(global._faceSegmentationHelpers[index].count == 0){
            if(!isNull(global._faceSegmentationHelpers[index].mlComponent)) {
                global._faceSegmentationHelpers[index].sceneObject.destroy();
            }
            global._faceSegmentationHelpers[index] = undefined;
        }
    }
//    print(global._faceSegmentationHelpers);
}

script.api.setLabelEnabled = function(label, value) {
    if (ML_ASSET_PARAMS.OUTPUT_NAMES.indexOf(label) >= 0) {
        material.mainPass[label + "Enabled"] = value;
        script[label] = value;
    } else {
        print("No such label " + label);
    }
}

script.api.getLabels = function() {
    return ML_ASSET_PARAMS.OUTPUT_NAMES;
}

script.api.getLabelEnabled = function(label) {
    if (ML_ASSET_PARAMS.OUTPUT_NAMES.indexOf(label) >= 0) {
        return material.mainPass[label + "Enabled"]
    } else {
        print("No such label " + label);
        return undefined;
    }
}

script.createEvent("OnStartEvent").bind(init);
script.createEvent("OnDestroyEvent").bind(onDestroy);