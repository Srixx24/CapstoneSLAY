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

        const stream = await navigator.mediaDevices.getUserMedia({ video: true });

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

        setLensSession(session); // Store session
        setIsLensReady(true);    // ✅ Mark as ready
        console.log("✅ Lens initialized");
      } catch (err) {
        console.error("❌ Failed to initialize AR lens:", err);
        alert("Unable to load AR experience. Please check your camera permissions.");
      }
    };

    initLens();
  }, []);

  // Convert HEX → normalized RGB (0–1)
  const hexToRgb = (hex: string) => {
    const bigint = parseInt(hex.replace("#", ""), 16);
    return {
      r: ((bigint >> 16) & 255) / 255,
      g: ((bigint >> 8) & 255) / 255,
      b: (bigint & 255) / 255,
    };
  };

  // Handle lipstick color selection
  const handleColorSelect = (hexColor: string) => {
    console.log("🎨 Button clicked:", hexColor);
    setSelectedShade(hexColor);
    const rgb = hexToRgb(hexColor);

    if (isLensReady && lensSession?.call) {
      lensSession.call("setLipColor", rgb); // Remote Lens API function
      console.log("✅ Sent color to lens:", rgb);
    } else {
      console.warn("❌ Lens session not ready.");
    }
  };

  // Placeholder for ML logic
  const handleRescan = () => {
    console.log("Rescan triggered – ML logic goes here.");
  };

  const lipstickShades = [
    "#580F41", "#5E0909", "#9F1C69", "#4B2E2B",
    "#87412F", "#C48189", "#C21807", "#CC5247",
  ];

  return (
    <div className="w-full min-h-screen flex flex-col items-center bg-black relative">
      <div className="w-full max-w-4xl md:mx-auto pt-4 px-4">
        {/* Snap Lens AR canvas */}
        <div className="h-[90vh] pt-10">
          <canvas ref={canvasRef} className="w-full h-full object-cover" />
        </div>

        {/* Lipstick color buttons */}
        <div className="w-full mt-6 text-center z-10">
          <h2 className="text-white font-semibold text-lg tracking-wide mb-4">
            CHOOSE LIPSTICK SHADE
          </h2>
          <div className="grid grid-cols-4 gap-4 place-items-center w-full md:max-w-md md:mx-auto">
            {lipstickShades.map((color, index) => (
              <button
                key={index}
                onClick={() => handleColorSelect(color)}
                className={`w-20 h-20 rounded-full focus:outline-none transition-shadow duration-200 ${
                  selectedShade === color
                    ? "ring-4 ring-white shadow-[0_0_10px_4px_white]"
                    : ""
                }`}
                style={{ backgroundColor: color }}
              />
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}

export default Home;
