// frontend/src/components/Navbar.tsx
import { Link } from "react-router-dom";
import Logo from "../../Assets/SLAY_LOGO.png";

function Navbar() {
  return (
    <nav className="flex justify-between items-center px-6 py-4 shadow bg-black">
      {/* Logo */}
      <div className="flex items-center">
        <img src={Logo} alt="SLAY Logo" className="h-10 w-auto" />
      </div>

      {/* Navigation Links */}
      <div className="space-x-4">
        <Link to="/" className="text-white hover:text-teal-400">
          Home
        </Link>
        <Link to="/demo" className="text-white hover:text-teal-400">
          Demo
        </Link>
      </div>
    </nav>
  );
}

export default Navbar;
