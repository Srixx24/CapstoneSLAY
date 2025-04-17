// frontend/vite.config.ts
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  base: "/CapstoneSLAY/", // Repo name Required for GitHub Pages
  plugins: [react()],
  server: {
    port: 5173,
  },
});
