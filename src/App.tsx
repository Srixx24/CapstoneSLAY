// frontend/src/App.tsx
import { Routes, Route } from "react-router-dom";
import NavBar from "./components/NavBar";
import Home from "./pages/Home";
import Demo from "./pages/Demo";

function App() {
  return (
    <div className="min-h-screen bg-black text-white">
      <NavBar />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/demo" element={<Demo />} />
      </Routes>
    </div>
  );
}

export default App;
