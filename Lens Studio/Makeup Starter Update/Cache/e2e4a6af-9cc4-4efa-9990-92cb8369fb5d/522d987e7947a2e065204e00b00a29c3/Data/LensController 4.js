// Main Controller
//
// Made with Easy Lens

//@input Component.ScriptComponent makeup
//@input Component.ScriptComponent faceEvents


try {

script.faceEvents.onFaceFound.add(function() {
    script.makeup.enabled = true;
});

script.faceEvents.onFaceLost.add(function() {
    script.makeup.enabled = false;
});

} catch(e) {
  print("error in controller");
  print(e);
}
