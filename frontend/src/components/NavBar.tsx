// frontend/src/components/Navbar.tsx
import { Link } from "react-router-dom";
import Logo from "../../Assets/SLAY_LOGO.png";

function Navbar() {
  return (
    <nav
      className="flex justify-between items-center px-6 py-4"
      style={{ backgroundColor: "#000000" }}
    >
      {/* Logo */}
      <div className="flex items-center">
        <img src={Logo} alt="SLAY Logo" className="h-16 w-auto" />
      </div>
    </nav>
  );
}

export default Navbar;
