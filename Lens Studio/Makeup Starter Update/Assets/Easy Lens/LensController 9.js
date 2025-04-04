// Main Controller
//
// Made with Easy Lens

//@input Component.ScriptComponent faceEvents
//@input Component.ScriptComponent beautification


try {

script.beautification.enabled = false;

script.faceEvents.onFaceFound.add(function() {
    script.beautification.enabled = true;
});

script.faceEvents.onFaceLost.add(function() {
    script.beautification.enabled = false;
});

} catch(e) {
  print("error in controller");
  print(e);
}
