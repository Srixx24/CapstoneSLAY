// Main Controller
//
// Made with Easy Lens

//@input Component.ScriptComponent beautification
//@input Component.ScriptComponent faceEvents


try {

script.beautification.enableLips = true;

function updateLipAlpha() {
    const angle = Math.abs(script.faceEvents.getHeadAngle());
    const maxAngle = 45; // maximum angle to consider for full visibility
    const minAlpha = 0.1;
    const maxAlpha = 0.8;

    // Calculate the alpha based on the angle
    const alpha = maxAlpha - (maxAlpha - minAlpha) * (angle / maxAngle);
    script.beautification.alphaLips = Math.max(minAlpha, Math.min(maxAlpha, alpha));
}

// Bind an update event to continuously adjust the lip makeup alpha
const updateEvent = script.createEvent("UpdateEvent");
updateEvent.bind(updateLipAlpha);

} catch(e) {
  print("error in controller");
  print(e);
}
