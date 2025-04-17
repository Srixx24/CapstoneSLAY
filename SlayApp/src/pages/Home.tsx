// SlayApp/src/pages/Home.tsx
import React, { useEffect, useRef, useState } from "react";
import {
  bootstrapCameraKit,
  createMediaStreamSource,
  Transform2D,
} from "@snap/camera-kit";

function Home() {
  // === STATE ===
  const [selectedShade, setSelectedShade] = useState<string | null>(null); // Currently selected lipstick shade
  const [lensSession, setLensSession] = useState<any>(null); // Holds the Snap lens session
  const [isLensReady, setIsLensReady] = useState(false); // Tracks if lens is fully initialized

  // === REFS ===
  const canvasRef = useRef<HTMLCanvasElement>(null); // Snap AR rendering canvas

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

        // Get the camera stream
        const stream = await navigator.mediaDevices.getUserMedia({
          video: true,
        });

        // Device-based resolution/fps configuration
        const isMobile = /Mobi|Android/i.test(navigator.userAgent);
        const isOldMac =
          /Macintosh/.test(navigator.userAgent) &&
          !window.MediaStreamTrack?.prototype?.getSettings;

        const width = isOldMac || isMobile ? 640 : 1280;
        const height = isOldMac || isMobile ? 480 : 720;
        const fpsLimit = isOldMac ? 30 : isMobile ? 60 : 100;

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

        // Make lens session globally available to call custom functions
        (window as any).lensSession = session;
      } catch (err) {
        console.error("❌ Failed to initialize AR lens:", err);
        alert("Unable to load AR experience. Please check your camera permissions.");
      }
    };

    initLens();
  }, []);

  // Convert HEX to normalized RGB (0-1 values)
  const hexToRgb = (hex: string) => {
    const bigint = parseInt(hex.replace("#", ""), 16);
    return {
      r: ((bigint >> 16) & 255) / 255,
      g: ((bigint >> 8) & 255) / 255,
      b: (bigint & 255) / 255,
    };
  };

  // Set the lipstick color on both UI and lens
  const handleColorSelect = (hexColor: string) => {
    setSelectedShade(hexColor);
    const rgb = hexToRgb(hexColor);
    if ((window as any).lensSession?.call) {
      (window as any).lensSession.call("setLipColor", rgb);
    }
  };

  // Trigger ML backend rescan (to be wired in)
  const handleRescan = () => {
    console.log("Rescan triggered - connect to ML backend");
  };

  // ML-recommended shades
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
    <div className="w-full min-h-screen flex flex-col items-center bg-black relative">
      <div className="w-full max-w-4xl md:mx-auto pt-4 px-4">
        {/* AR canvas */}
        <div className="h-[90vh] pt-10">
          <canvas ref={canvasRef} className="w-full h-full object-cover" />
        </div>

        {/* Lipstick selection buttons */}
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
