// frontend/src/pages/Demo.tsx
function Demo() {
  return (
    <div className="w-full h-[90vh] p-4">
      <iframe
        src="https://lens.snap.com/experience/fc3ac764-ec2f-49d8-aa6f-60b0e5bd5210"
        title="SLAY AR Demo"
        className="w-full h-full rounded-xl shadow border"
        allow="camera; microphone; fullscreen"
      />
    </div>
  );
}

export default Demo;