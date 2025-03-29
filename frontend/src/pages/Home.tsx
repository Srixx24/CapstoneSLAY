// frontend/src/pages/Home.tsx
function Home() {
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
      {/* Demo iframe */}
      <div className="w-screen -mx-4">
        <div className="h-[90vh]">
          <iframe
            src="https://srixx24.github.io/WebXRBusinessCard/"
            title="SLAY AR Demo"
            className="w-full h-full"
            allow="camera; microphone; fullscreen"
            style={{ border: "none" }}
          />
        </div>
      </div>

      {/* First Row of Buttons - Responsive width */}
      <div className="flex w-screen -mx-4 md:mx-auto md:max-w-md">
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

      {/* Second Row of Buttons - Responsive width with updated rounding */}
      <div className="flex gap-4 w-full md:max-w-md md:mx-auto mt-4">
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

      {/* Lipstick Shade Section - Responsive width */}
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
            <div
              key={index}
              className="w-20 h-20 rounded-full"
              style={{ backgroundColor: color }}
            ></div>
          ))}
        </div>
      </div>
    </div>
  );
}

export default Home;
