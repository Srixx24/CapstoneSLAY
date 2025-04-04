//@input Asset.Texture imageTex
//@input int renderOrder = 0
//@input Asset.Material imageMaterial

let imageComp;

function init() {
    const so = script.getSceneObject();
    imageComp = so.createComponent("Component.Image");
    so.renderOrder = script.renderOrder;
    const mat = script.imageMaterial.clone();
    imageComp.stretchMode = StretchMode.FillAndCut;
    imageComp.materials = [mat];
    if(script.imageTex) {
        imageComp.renderOrder = script.renderOrder;
        mat.mainPass.baseTex = script.imageTex;
    }
    else{
        print('2D Frame Error: missing texture');
        imageComp.enabled = false;
    }

    script.createEvent("OnDisableEvent").bind(function() {
        if (imageComp) {
            imageComp.enabled = false;
        }
    });
    script.createEvent("OnEnableEvent").bind(function() {
        if (imageComp) {
            imageComp.enabled = true;
        }
    });
    
    bindProperty("imageTex", mat.mainPass, "baseTex");
}

function bindProperty(inputName, target, propName) {
    Object.defineProperty(script, inputName, {
        set: function(val) {
            if (!target) {
                print('2D Frame Error: could not set '+inputName);
                return;
            }
            imageComp.enabled = true;
            target[propName] = val;
        }
    });
}

init();
