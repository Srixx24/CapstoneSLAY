// frontend/src/pages/Demo.tsx
function Demo() {
  return (
    <div className="w-full h-[90vh] p-4">
      <iframe
        src="https://srixx24.github.io/WebXRBusinessCard/"
        title="SLAY AR Demo"
        className="w-full h-full rounded-xl shadow border"
        allow="camera; microphone; fullscreen"
      />
    </div>
  );
}

export default Demo;
