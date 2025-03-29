// frontend/src/pages/Demo.tsx
function Demo() {
  return (
    <div className="w-full h-[90vh] p-4 flex flex-col items-center gap-4">
      {/* Demo iframe */}
      <div className="w-full h-full">
        <iframe
          src="https://srixx24.github.io/WebXRBusinessCard/"
          title="SLAY AR Demo"
          className="w-full h-full rounded-xl shadow border"
          allow="camera; microphone; fullscreen"
        />
      </div>

      {/* First Row of Buttons - No gap, hard edges */}
      <div className="flex w-full">
        {['Scan', 'Shade', 'Liner', 'Save'].map((label, index) => (
          <button
            key={index}
            className="flex-1 py-2 bg-teal-500 text-white border border-white rounded-none"
          >
            {label}
          </button>
        ))}
      </div>

      {/* Second Row of Buttons - 2 connected pairs with space in between */}
      <div className="flex gap-4">
        <div className="flex">
          <button className="px-4 py-2 bg-gray-800 text-white rounded-none">
            Gloss
          </button>
          <button className="px-4 py-2 bg-gray-800 text-white rounded-none">
            Matte
          </button>
        </div>
        <div className="flex">
          <button className="px-4 py-2 bg-gray-800 text-white rounded-none">
            Opacity
          </button>
          <button className="px-4 py-2 bg-gray-800 text-white rounded-none">
            Full
          </button>
        </div>
      </div>
    </div>
  );
}

export default Demo;
