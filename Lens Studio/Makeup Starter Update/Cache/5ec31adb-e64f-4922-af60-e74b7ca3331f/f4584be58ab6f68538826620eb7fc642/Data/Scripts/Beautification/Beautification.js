// Beauty CC V1.1
// 22.08.24

//@input Asset.ObjectPrefab beautyPrefab;
//@input int renderOrder;

//@input int faceIndex = 0 {"widget":"combobox", "values":[{"label":"First", "value":0}, {"label":"Second", "value":1} ]}
//@ui {"widget":"separator"}


//@ui {"label":"Retouch"}
//@input bool enableRetouch = true;
//@ui {"widget":"separator"}

//@input bool enableLips = true {"label": "Lips Tint"}
//@ui {"widget":"group_start", "label": "Lips Tint Properties",  "showIf" : "enableLips"}
//@input vec3 colorLips = {1.0,0.0,0.0} {"widget":"color", "showIf" : "enableLips", "label":"Color"}
//@input float alphaLips = 0.45 {"widget":"slider", "min": 0.0, "max": 1.0, "step": 0.01, "showIf" : "enableLips", "label": "Intensity"}
//@input bool applyLipsFix = false {"label": "Fix Lips Gap", "hint" : "Remove gap between lips when they are closed. Good to use with dark bold colors"}
//@ui {"widget":"group_end"}

//@input bool enableLipgloss = true {"label": "Lip Gloss"}
//@ui {"widget":"group_start", "label": "Lip Gloss Properties",  "showIf" : "enableLipgloss"}
//@input vec3 colorLipgloss = {1.0,1.0,1.0} {"widget":"color", "showIf" : "enableLipgloss", "label":"Color"}
//@input float alphaLipgloss = 0.8 {"widget":"slider", "min": 0.0, "max": 1.0, "step": 0.01, "showIf" : "enableLipgloss", "label": "Intensity"}
//@ui {"widget":"group_end"}
//@ui {"widget":"separator"}

//@input bool enableBlush = true {"label": "Blush"}
//@ui {"widget":"group_start", "label": "Blush Properties",  "showIf" : "enableBlush"}
//@input vec3 colorBlush = {0.92,0.65,0.68} {"widget":"color", "showIf" : "enableBlush", "label":"Color"}
//@input float alphaBlush = 0.5 {"widget":"slider", "min": 0.0, "max": 1.0, "step": 0.01, "showIf" : "enableBlush", "label": "Intensity"}
//@ui {"widget":"group_end"}
//@ui {"widget":"separator"}


//@input bool enableEyeliner = true {"label": "Eyeliner"}
//@ui {"widget":"group_start", "label": "Eyeliner Properties",  "showIf" : "enableEyeliner"}
//@input vec3 colorEyeliner = {0.2,0.2,0.2} {"widget":"color", "showIf" : "enableEyeliner", "label":"Color"}
//@input float alphaEyeliner = 0.8 {"widget":"slider", "min": 0.0, "max": 1.0, "step": 0.01, "showIf" : "enableEyeliner", "label": "Intensity"}
//@ui {"widget":"group_end"}
//@ui {"widget":"separator"}

//@input bool enableEyeshadow = true {"label": "Eyeshadow"}
//@ui {"widget":"group_start", "label": "Eyeshadow Properties",  "showIf" : "enableEyeshadow"}

//@ui {"widget":"group_start", "label": "First Color"}
//@input vec3 colorEyeshadow1 = {1.0,0.0,0.0} {"widget":"color", "showIf" : "enableEyeshadow", "label":"Color"}
//@input float alphaEyeshadow1 = 0.8 {"widget":"slider", "min": 0.0, "max": 1.0, "step": 0.01, "showIf":"enableEyeshadow", "label": "Intensity"}
//@ui {"widget":"group_end"}

//@ui {"widget":"group_start", "label": "Second Color", "showIf" : "eyeshadowType", "showIfValue" : 1}
//@input vec3 colorEyeshadow2 = {0.0,1.0,0.0} {"widget":"color", "label":"Color 2"}
//@input float alphaEyeshadow2 = 0.8 {"widget":"slider", "min": 0.0, "max": 1.0, "step": 0.01, "label": "Intensity 2"}
//@ui {"widget":"group_end"}
//@ui {"widget":"group_end"}

//@ui {"widget":"separator"}

//@input bool enableMascara = true {"label": "Mascara"}
//@ui {"widget":"group_start", "label": "Mascara Properties",  "showIf" : "enableMascara"}
//@input vec3 colorMascara = {1.0,0.0,0.0} {"widget":"color", "showIf" : "enableMascara", "label":"Color"}
//@input float alphaMascara = 0.8 {"widget":"slider", "min": 0.0, "max": 1.0, "step": 0.01, "showIf" : "enableMascara", "label": "Intensity"}
//@ui {"widget":"group_end"}
//@ui {"widget":"separator"}

//@input bool enableEyebrows = true {"label": "Eyebrows"}
//@ui {"widget":"group_start", "label": "Eyebrows Properties",  "showIf" : "enableEyebrows"}
//@input vec3 colorEyebrows = {0.0,0.0,0.0} {"widget":"color", "showIf" : "enableEyebrows", "label":"Color"}
//@input float alphaEyebrows = 0.4 {"widget":"slider", "min": 0.0, "max": 1.0, "step": 0.01, "showIf" : "enableEyebrows", "label": "Intensity"}
//@ui {"widget":"group_end"}
//@ui {"widget":"separator"}



let pfb,parentSO;

let inputs = {
    enableRetouch: script.enableRetouch,
    enableLips: script.enableLips,
    enableLipgloss: script.enableLipgloss,
    enableBlush: script.enableBlush,
    enableEyeliner: script.enableEyeliner,
    enableEyeshadow: script.enableEyeshadow,
    enableMascara: script.enableMascara,
    enableEyebrows: script.enableEyebrows,

    colorLips: script.colorLips,
    colorLipgloss: script.colorLipgloss,
    colorBlush: script.colorBlush,
    colorEyeliner: script.colorEyeliner,
    colorEyeshadow1: script.colorEyeshadow1,
    colorEyeshadow2: script.colorEyeshadow2,
    colorMascara: script.colorMascara,
    colorEyebrows: script.colorEyebrows,

    alphaLips: script.alphaLips,
    alphaLipgloss: script.alphaLipgloss,
    alphaBlush: script.alphaBlush,
    alphaEyeliner: script.alphaEyeliner,
    alphaEyeshadow1: script.alphaEyeshadow1,
    alphaEyeshadow2: script.alphaEyeshadow2,
    alphaMascara: script.alphaMascara,
    alphaEyebrows: script.alphaEyebrows
};


function init(){
    if(!validateInputs()){
        return;
    }
    parentSO = global.scene.createSceneObject('Beauty');
    setLayerRO(parentSO);
    parentSO.setParent(script.getSceneObject());
    pfb = script.beautyPrefab.instantiate(parentSO);
    for(var i=0;i < pfb.getChildrenCount();i++){
        setLayerRO(pfb.getChild(i));
    }
    script.lips = retFMask('Lips');
    script.lipgloss = retFMask('Lipgloss');
    script.blush = retFMask('Blush');
    script.eyeliner = retFMask('Eyeliner');    
    script.eyeshadow = [retFMask('Eyeshadows 1'),retFMask('Eyeshadows 2')];
    script.mascara = retFMask('Mascara');
    script.eyebrows = retFMask('Eyebrows');
    script.lipsController = script.lips.getSceneObject().getComponent('Component.ScriptComponent');
    script.retouch = retObj(pfb,'Retouch 1');
    setBeauty();
    script.createEvent('OnDisableEvent').bind(function(){
        parentSO.enabled = false;
    })
    script.createEvent('OnEnableEvent').bind(function(){
        parentSO.enabled = true;
    })
    bindProperties();
}

function setColor(_component, _color, alpha) {
    var pass = _component.mainPass;
    if (pass) {
        pass.baseColor = new vec4(_color.x, _color.y, _color.z, alpha);
    } else {
        print("[MakeupController] ERROR: Material is not set for " + _component.getSceneObject().name);
    }
}

function validateInputs(){
    const parentCam = getParentCamera(script.getSceneObject());
    if (!parentCam) {
        print("Error in Beauty CC: Please create the component under a camera");
        return false;
    }
    return true;
}

function setRetouch(){
    if(script.retouch){
        script.retouch.enabled = script.enableRetouch;
    }
}

function setLips(){
    if (script.lips) {
        script.lips.enabled = inputs.enableLips;
        script.lips.faceIndex = script.faceIndex;
        
        var lipsController = script.lipsController;
        
        if (lipsController) { 
            if (script.applyLipsFix) {
                lipsController.enabled = true;
            } else {
                lipsController.enabled = false;
            }
        }
        setColor(script.lips, inputs.colorLips, inputs.alphaLips);
    } else if (enableLips) {
        print("[MakeupController] ERROR: Lips object is not assigned or doesn't exist. Please assign it under Advanced checkbox");
    }
}

function setLipGloss(){
    if (script.lipgloss) {
        script.lipgloss.enabled = inputs.enableLipgloss;
        script.lipgloss.faceIndex = script.faceIndex;
        setColor(script.lipgloss, inputs.colorLipgloss, inputs.alphaLipgloss);
    } else if (inputs.enableLipgloss) {
        print("[MakeupController] ERROR: Lipgloss object is not assigned or doesn't exist. Please assign it under Advanced checkbox");
    }
}

function setBlush(){
    if (script.blush) {
        script.blush.enabled = inputs.enableBlush;
        script.blush.faceIndex = script.faceIndex;
        setColor(script.blush, inputs.colorBlush, inputs.alphaBlush);
    } else if (inputs.enableBlush) {
        print("[MakeupController] ERROR: Blush object is not assigned or doesn't exist. Please assign it under Advanced checkbox");
    }
}

function setEyeliner(){
    if (script.eyeliner) {
        script.eyeliner.enabled = inputs.enableEyeliner;
        script.eyeliner.faceIndex = script.faceIndex;
        setColor(script.eyeliner, inputs.colorEyeliner, inputs.alphaEyeliner);
    } else if (inputs.enableEyeliner) {
        print("[MakeupController] ERROR: Eyeliner object is not assigned or doesn't exist. Please assign it under Advanced checkbox");
    }
}

function setEyeshadow(){
    if (inputs.enableEyeshadow) {
        if (script.eyeshadow) {
                
            script.eyeshadow[0].faceIndex = script.faceIndex;
            script.eyeshadow[1].faceIndex = script.faceIndex;

            script.eyeshadow[0].enabled = true;
            setColor(script.eyeshadow[1], inputs.colorEyeshadow1, inputs.alphaEyeshadow1);
    
            script.eyeshadow[1].enabled = true;
            setColor(script.eyeshadow[0],inputs.colorEyeshadow2, inputs.alphaEyeshadow2);
        } else {
            print("[MakeupController] ERROR: Eyeshadows objects are not assigned or don't exist. Please assign them under Advanced checkbox");
        }
    }
}

function setMascara(){
    if (script.mascara) {
        script.mascara.enabled = inputs.enableMascara;
        script.mascara.faceIndex = script.faceIndex;
        setColor(script.mascara, inputs.colorMascara,inputs.alphaMascara);
    } else if (inputs.enableMascara) {
        print("[MakeupController] ERROR: Mascara object is not assigned or doesn't exist. Please assign it under Advanced checkbox");
    }
}
function setEyebrows(){
    if (script.eyebrows) {
        script.eyebrows.enabled = inputs.enableEyebrows;
        script.eyebrows.faceIndex = script.faceIndex;
        setColor(script.eyebrows, inputs.colorEyebrows, inputs.alphaEyebrows);
    } else if (inputs.enableEyebrows) {
        print("[MakeupController] ERROR: Eyebrows object is not assigned or doesn't exist. Please assign it under Advanced checkbox");
    }
}

function setBeauty(){      
    setRetouch();
    setLips();
    setLipGloss();
    setBlush();
    setEyeliner();
    setEyeshadow();
    setMascara();
    setEyebrows();    
}

init();

// Helpers
function retFMask(name){
    return retObj(pfb,name).getComponent('Component.FaceMaskVisual');
}

function setLayerRO(obj){
    obj.renderOrder = script.renderOrder;
    obj.layer = script.getSceneObject().layer;
}

function retObj(obj, name) {
    if (!obj) {
        return null;
    }

    if (obj.name == name) {
        return obj;
    }

    for (var i=0; i<obj.getChildrenCount(); i++) {
        const c = retObj(obj.getChild(i), name);
        if (c) {
            return c;
        }
    }

    return null;
}

function getParentCamera(obj) {
    if (!obj) {
        return null;
    }

    var cam = obj.getComponent("Component.Camera");
    if (cam) {
        return cam;
    }

    return getParentCamera(obj.getParent());
}

function bindProperties(){
    bindProperty('enableRetouch', setRetouch);
    bindProperty('enableLips', setLips);
    bindProperty('enableLipgloss', setLipGloss);
    bindProperty('enableBlush', setBlush);
    bindProperty('enableEyeliner', setEyeliner);
    bindProperty('enableEyeshadow', setEyeshadow);
    bindProperty('enableMascara', setMascara);
    bindProperty('enableEyebrows', setEyebrows);
    
    bindProperty('colorLips', setLips);
    bindProperty('colorLipgloss', setLipGloss);
    bindProperty('colorBlush', setBlush);
    bindProperty('colorEyeliner', setEyeliner);
    bindProperty('colorEyeshadow1', setEyeshadow);
    bindProperty('colorEyeshadow2', setEyeshadow);
    bindProperty('colorEyeshadow3', setEyeshadow);
    bindProperty('colorMascara', setMascara);
    bindProperty('colorEyebrows', setEyebrows);
    
    bindProperty('alphaLips', setLips);
    bindProperty('alphaLipgloss', setLipGloss);
    bindProperty('alphaBlush', setBlush);
    bindProperty('alphaEyeliner', setEyeliner);
    bindProperty('alphaEyeshadow1', setEyeshadow);
    bindProperty('alphaEyeshadow2', setEyeshadow);
    bindProperty('alphaEyeshadow3', setEyeshadow);
    bindProperty('alphaMascara', setMascara);
    bindProperty('alphaEyebrows', setEyebrows);
}

function bindProperty(target,func) {
    Object.defineProperty(script, target, {
        set: function(val) {
            inputs[target] = val;
            func();
        },
        get: function(){
            return inputs[target];
        }
    });
}
