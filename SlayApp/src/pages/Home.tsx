// SlayApp/src/pages/Home.tsx
import React from "react";
import { useEffect, useRef, useState } from "react";
import {
  bootstrapCameraKit,
  createMediaStreamSource,
  Transform2D,
} from "@snap/camera-kit";

function Home() {
  // Track selected lipstick color
  const [selectedShade, setSelectedShade] = useState<string | null>(null);
  // Reference to the AR canvas
  const canvasRef = useRef<HTMLCanvasElement>(null);

  useEffect(() => {
    const initLens = async () => {
      // Snap API credentials
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

        const width = 1280;
        const height = 720;
        const fpsLimit = 100;

        const source = createMediaStreamSource(stream, {
          transform: Transform2D.MirrorX,
          cameraType: "user",
          fpsLimit,
        });

        await session.setSource(source);
        await source.setRenderSize(width, height);

        const { lenses } = await cameraKit.lensRepository.loadLensGroups([
          lensGroupId,
        ]);
        if (!lenses.length) throw new Error("No lenses found in group.");
        await session.applyLens(lenses[0]);
        await session.play();

        (window as any).lensSession = session;
      } catch (err) {
        console.error("Failed to initialize AR lens:", err);
        alert(
          "Unable to load AR experience. Please check your camera permissions and try again."
        );
      }
    };

    initLens();
  }, []);

  // Set the lipstick color on both UI and lens
  const handleColorSelect = (rgb: { r: number; g: number; b: number }) => {
    if ((window as any).lensSession?.call) {
      (window as any).lensSession.call("setLipColor", rgb);
    }
  };

  const lipstickShades = [
    { name: "Rich Plum", color: { r: 0.345, g: 0.059, b: 0.255 } },
    { name: "Deep Red", color: { r: 0.368, g: 0.035, b: 0.035 } },
    { name: "Berry Fuchsia", color: { r: 0.624, g: 0.11, b: 0.412 } },
    { name: "Chocolate Brown", color: { r: 0.294, g: 0.18, b: 0.169 } },
    { name: "Terracotta", color: { r: 0.529, g: 0.255, b: 0.184 } },
    { name: "Dusty Rose", color: { r: 0.769, g: 0.506, b: 0.537 } },
    { name: "Cherry Red", color: { r: 0.761, g: 0.094, b: 0.027 } },
    { name: "Soft Pink Nude", color: { r: 0.8, g: 0.32, b: 0.72 } },
  ];

  return (
    <div className="w-full min-h-screen flex flex-col items-center bg-black relative">
      <div className="w-full max-w-4xl md:mx-auto pt-4 px-4">
        <div className="h-[90vh] pt-10">
          <canvas ref={canvasRef} className="w-full h-full object-cover" />
        </div>

        <div className="w-full mt-6 text-center z-10">
          <h2 className="text-white font-semibold text-lg tracking-wide mb-4">
            CHOOSE LIPSTICK SHADE
          </h2>
          <div className="grid grid-cols-4 gap-4 place-items-center w-full md:max-w-md md:mx-auto">
            {lipstickShades.map(({ name, color }, index) => (
              <button
                key={index}
                onClick={() => {
                  handleColorSelect(color);
                  setSelectedShade(name);
                }}
                className={`w-20 h-20 rounded-full focus:outline-none transition-shadow duration-200 ${
                  selectedShade === name
                    ? "ring-4 ring-white shadow-[0_0_10px_4px_white]"
                    : ""
                }`}
                style={{
                  backgroundColor: `rgba(${color.r * 255}, ${color.g * 255}, ${
                    color.b * 255
                  }, 1)`,
                }}
                title={name}
              />
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}

export default Home;
