// SlayApp/src/pages/Home.tsx
import React from "react";
import { useEffect, useRef, useState } from "react";
import {
  bootstrapCameraKit,
  createMediaStreamSource,
  Transform2D,
} from "@snap/camera-kit";

function Home() {
  const [selectedShade, setSelectedShade] = useState<string | null>(null);
  const canvasRef = useRef<HTMLCanvasElement>(null);

  useEffect(() => {
    const initLens = async () => {
      const apiToken =
        "eyJhbGciOiJIUzI1NiIsImtpZCI6IkNhbnZhc1MyU0hNQUNQcm9kIiwidHlwIjoiSldUIn0.eyJhdWQiOiJjYW52YXMtY2FudmFzYXBpIiwiaXNzIjoiY2FudmFzLXMyc3Rva2VuIiwibmJmIjoxNzQ0NDM2Mjc4LCJzdWIiOiJhOTM1Mjc4NS04MmQ3LTQ0OGQtOWM2My04NjljNGNjNTM4Yzh-U1RBR0lOR35hNzFkZWJlZC0wMWU5LTQ0MzItYjZlZC04Y2Q3MmVjMGQ3YTQifQ.ZrEe-gg-Wa1Lnl8STpxahlb82zH28VjVRCJQ-nrKr_4";
      const lensGroupId = "73f33df8-9d14-4f03-b133-954a25da0974";

      try {
        const cameraKit = await bootstrapCameraKit({ apiToken });
        const session = await cameraKit.createSession({
          liveRenderTarget: canvasRef.current!,
        });

        session.events.addEventListener("error", (event) => {
          console.error("Lens error:", event.detail.error);
        });

        const stream = await navigator.mediaDevices.getUserMedia({
          video: true,
        });
        const source = createMediaStreamSource(stream, {
          transform: Transform2D.MirrorX,
          cameraType: "user",
          fpsLimit: 100,
        });

        await session.setSource(source);
        await source.setRenderSize(1280, 720);

        const { lenses } = await cameraKit.lensRepository.loadLensGroups([
          lensGroupId,
        ]);
        if (!lenses.length) throw new Error("No lenses found in group.");
        await session.applyLens(lenses[0]);

        await session.play();
        console.log("Lens rendering started.");
      } catch (err) {
        console.error("Failed to initialize AR lens:", err);
        alert(
          "Unable to load AR experience. Please check your camera permissions and try again."
        );
      }
    };

    initLens();
  }, []);

  const handleMouseEnter = (e: React.MouseEvent<HTMLButtonElement>) => {
    e.currentTarget.style.backgroundColor = "black";
    e.currentTarget.style.color = "white";
  };

  const handleMouseLeave = (e: React.MouseEvent<HTMLButtonElement>) => {
    e.currentTarget.style.backgroundColor = "#e3e0d1";
    e.currentTarget.style.color = "black";
  };

  const handleMouseDown = (e: React.MouseEvent<HTMLButtonElement>) => {
    e.currentTarget.style.backgroundColor = "black";
    e.currentTarget.style.color = "white";
  };

  const handleMouseUp = (e: React.MouseEvent<HTMLButtonElement>) => {
    e.currentTarget.style.backgroundColor = "#e3e0d1";
    e.currentTarget.style.color = "black";
  };

  const handleRescan = () => {
    console.log("Rescan triggered - connect to ML backend");
  };

  const lipstickShades = [
    "#580F41", // Rich Plum
    "#5E0909", // Deep Red
    "#9F1C69", // Berry Fuchsia
    "#4B2E2B", // Chocolate Brown
    "#87412F", // Light Brown Terracotta
    "#C48189", // Dusty Rose
    "#C21807", // Classic Cherry Red
    "#CC5247", // Soft Pink Nude
  ];

  return (
    <div className="w-full min-h-screen p-4 flex flex-col items-center bg-black">
      <div className="w-full md:max-w-4xl md:mx-auto -mx-4">
        <div className="h-[90vh]">
          <canvas ref={canvasRef} className="w-full h-full" />
        </div>
      </div>

      <div className="w-full mt-6 text-center">
        <h2 className="text-white font-semibold text-lg tracking-wide mb-4">
          CHOOSE LIPSTICK SHADE
        </h2>
        <div className="grid grid-cols-4 gap-4 place-items-center w-full md:max-w-md md:mx-auto">
          {lipstickShades.map((color, index) => (
            <button
              key={index}
              onClick={() => setSelectedShade(color)}
              className={`w-20 h-20 rounded-full focus:outline-none transition-shadow duration-200 ${
                selectedShade === color ? "ring-4 ring-white shadow-[0_0_10px_4px_white]" : ""
              }`}
              style={{ backgroundColor: color }}
            />
          ))}
        </div>

        <button
          onClick={handleRescan}
          className="mt-6 px-6 py-2 font-semibold rounded-full border"
          style={{ backgroundColor: "#f5f0e6", color: "black" }}
        >
          Rescan
        </button>
      </div>
    </div>
  );
}

export default Home;
