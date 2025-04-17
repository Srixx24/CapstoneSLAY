// src/components/Navbar.tsx
import { Link } from "react-router-dom";
import Logo from "../../Assets/SLAY_LOGO.png";

function Navbar() {
  return (
    <nav className="h-screen w-24 bg-black flex flex-col items-center py-6 space-y-6 fixed left-0 top-0 z-20">
      {/* Logo at the top */}
      <img src={Logo} alt="SLAY Logo" className="h-16 w-auto" />

      {/* Navigation links (optional) */}
      {/* <Link to="/" className="text-white text-sm hover:underline">Home</Link>
      <Link to="/about" className="text-white text-sm hover:underline">About</Link> */}
    </nav>
  );
}

export default Navbar;
