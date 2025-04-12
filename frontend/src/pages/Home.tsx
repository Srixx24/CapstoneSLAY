// frontend/src/pages/Home.tsx
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
        await source.setRenderSize(640, 480);

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

  return (
    <div className="w-full min-h-screen p-4 flex flex-col items-center bg-black">
      <div className="w-full md:max-w-4xl md:mx-auto -mx-4">
        <div className="h-[90vh]">
          <canvas ref={canvasRef} className="w-full h-full" />
        </div>

        <div className="flex w-full">
          {["Scan", "Shade", "Liner", "Save"].map((label, index) => (
            <button
              key={index}
              className="flex-1 py-2 rounded-none font-semibold transition-colors duration-200"
              style={{
                backgroundColor: "#e3e0d1",
                color: "black",
                border: "none",
              }}
              onMouseEnter={handleMouseEnter}
              onMouseLeave={handleMouseLeave}
              onMouseDown={handleMouseDown}
              onMouseUp={handleMouseUp}
            >
              {label}
            </button>
          ))}
        </div>

        <div className="flex gap-4 w-full mt-4">
          <div className="flex flex-1">
            <button
              className="flex-1 py-2 font-semibold transition-colors duration-200 rounded-l-full"
              style={{
                backgroundColor: "#e3e0d1",
                color: "black",
                border: "1px solid #e3e0d1",
              }}
              onMouseEnter={handleMouseEnter}
              onMouseLeave={handleMouseLeave}
              onMouseDown={handleMouseDown}
              onMouseUp={handleMouseUp}
            >
              Gloss
            </button>
            <button
              className="flex-1 py-2 font-semibold transition-colors duration-200 rounded-r-full"
              style={{
                backgroundColor: "#e3e0d1",
                color: "black",
                border: "1px solid #e3e0d1",
              }}
              onMouseEnter={handleMouseEnter}
              onMouseLeave={handleMouseLeave}
              onMouseDown={handleMouseDown}
              onMouseUp={handleMouseUp}
            >
              Matte
            </button>
          </div>
          <div className="flex flex-1">
            <button
              className="flex-1 py-2 font-semibold transition-colors duration-200 rounded-l-full"
              style={{
                backgroundColor: "#e3e0d1",
                color: "black",
                border: "1px solid #e3e0d1",
              }}
              onMouseEnter={handleMouseEnter}
              onMouseLeave={handleMouseLeave}
              onMouseDown={handleMouseDown}
              onMouseUp={handleMouseUp}
            >
              Opacity
            </button>
            <button
              className="flex-1 py-2 font-semibold transition-colors duration-200 rounded-r-full"
              style={{
                backgroundColor: "#e3e0d1",
                color: "black",
                border: "1px solid #e3e0d1",
              }}
              onMouseEnter={handleMouseEnter}
              onMouseLeave={handleMouseLeave}
              onMouseDown={handleMouseDown}
              onMouseUp={handleMouseUp}
            >
              Full
            </button>
          </div>
        </div>
      </div>

      <div className="w-full mt-6 text-center">
        <h2 className="text-white font-semibold text-lg tracking-wide mb-4">
          CHOOSE LIPSTICK SHADE
        </h2>
        <div className="grid grid-cols-4 gap-4 place-items-center w-full md:max-w-md md:mx-auto">
          {[
            "#b9413e",
            "#c43337",
            "#b62517",
            "#9f1a16",
            "#95251b",
            "#732824",
            "#882624",
            "#62221c",
          ].map((color, index) => (
            <button
              key={index}
              onClick={() => setSelectedShade(color)}
              className={`w-20 h-20 rounded-full focus:outline-none transition-shadow duration-200 ${
                selectedShade === color ? "ring-4 ring-white shadow-lg" : ""
              }`}
              style={{ backgroundColor: color }}
            />
          ))}
        </div>
      </div>
    </div>
  );
}

export default Home;
