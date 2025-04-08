// frontend/src/pages/Demo.tsx
import { useState } from "react";
import lipstickShades from "../data/lipstickShades.json";

function Demo() {
  const [selectedColor, setSelectedColor] = useState<string | null>(null);

  const sendColorToAR = (color: string) => {
    const iframe = document.getElementById("ar-frame") as HTMLIFrameElement;
    if (iframe && iframe.contentWindow) {
      iframe.contentWindow.postMessage({ type: "SET_LIP_COLOR", color }, "*");
    }
  };

  const handleColorClick = (color: string) => {
    setSelectedColor(color);
    sendColorToAR(color);
  };

  return (
    <div className="w-full min-h-screen p-4 bg-black text-white flex flex-col items-center gap-6">
      {/* AR Iframe */}
      <div className="w-full md:max-w-4xl h-[90vh]">
        <iframe
          id="ar-frame"
          src="https://srixx24.github.io/WebXRBusinessCard/"
          title="SLAY AR Demo"
          className="w-full h-full rounded-xl shadow border-0"
          allow="camera; microphone; fullscreen"
        />
      </div>

      {/* Lipstick shade buttons */}
      <h2 className="text-lg font-bold text-white">CHOOSE LIPSTICK SHADE</h2>
      <div className="grid grid-cols-4 gap-4 place-items-center w-full md:max-w-md">
        {lipstickShades.map((shade, index) => (
          <button
            key={index}
            className={`w-20 h-20 rounded-full transition-shadow duration-300 ${
              selectedColor === shade.hex ? "ring-4 ring-white" : ""
            }`}
            style={{ backgroundColor: shade.hex }}
            onClick={() => handleColorClick(shade.hex)}
          />
        ))}
      </div>
    </div>
  );
}

export default Demo;
