// frontend/src/components/Navbar.tsx
import { Link } from "react-router-dom";

function Navbar() {
  return (
    <nav className="flex justify-between items-center px-6 py-4 shadow bg-white">
      <h1 className="text-xl font-bold text-purple-600">SLAY</h1>
      <div className="space-x-4">
        <Link to="/" className="text-gray-700 hover:text-purple-600">
          Home
        </Link>
        <Link to="/demo" className="text-gray-700 hover:text-purple-600">
          Demo
        </Link>
      </div>
    </nav>
  );
}

export default Navbar;
