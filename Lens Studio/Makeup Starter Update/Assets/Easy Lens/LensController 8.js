// Main Controller
//
// Made with Easy Lens

//@input Component.ScriptComponent beautification
//@input Component.ScriptComponent faceEvents


try {

script.beautification.enabled = false;

script.faceEvents.onFaceFound.add(function() {
    script.beautification.enabled = true;
    script.beautification.enableLips = true;
    script.beautification.enableEyeshadow = true;
    script.beautification.enableEyeliner = true;
    script.beautification.enableMascara = true;
});

script.faceEvents.onFaceLost.add(function() {
    script.beautification.enabled = false;
});

script.faceEvents.onMouthOpened.add(function() {
    script.beautification.enableLips = true;
});

script.faceEvents.onMouthClosed.add(function() {
    script.beautification.enableLips = false;
});

script.faceEvents.onBrowsRaised.add(function() {
    script.beautification.enableEyeshadow = true;
    script.beautification.enableEyeliner = true;
    script.beautification.enableMascara = true;
});

script.faceEvents.onBrowsLowered.add(function() {
    script.beautification.enableEyeshadow = false;
    script.beautification.enableEyeliner = false;
    script.beautification.enableMascara = false;
});

} catch(e) {
  print("error in controller");
  print(e);
}
