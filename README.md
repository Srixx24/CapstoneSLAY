![SLAY_Capstone (1)](https://github.com/user-attachments/assets/9abd1a76-f1a5-421d-8226-04c089c0f9eb)

<p align="center">
✨Presented by <a href="https://github.com/KayKilb">Kaylene Kilbourn</a>, <a href="https://github.com/AAndrews-1982">Alton Andrews</a>, <a href="https://github.com/AlleywayNate">Nathen Williams</a>, <a href="">Kasper Bouldin</a>, and <a href="https://github.com/Srixx24/">Jackie Lovins</a> ✨
</p>

<br>

URL for site:
https://srixx24.github.io/CapstoneSLAY/

## 🧠 Git Branch Workflow (Team Collaboration Guide)

To prevent merge conflicts and streamline teamwork:

### 🌱 Branch Strategy

- `main` → Production-ready code only
- `dev` (optional) → Shared staging/merge testing
- Feature branches: `frontend-kaylene`, `backend-alton`, etc.

### ✅ Standard Workflow

1. **Pull latest from main**
   ```bash
   git checkout main
   git pull origin main
   ```
2. **Create your branch**
   ```bash
   git checkout -b frontend-kaylene
   ```
3. **Do your work** → Add/commit often
4. **Push your branch**
   ```bash
   git push origin frontend-kaylene
   ```
5. **Create Pull Request** (PR)
   - Base: `main`
   - Compare: `your-branch-name`
   - Summary: what you added or changed
6. **Team reviews & merges**

> ⚠️ Avoid editing same files as others to prevent merge conflicts.

---

## 🛠 Dev Setup

```bash
cd frontend
npm install
npm run dev
```

Visit: http://localhost:5173

---

## 📂 Pages & Routes

| Route   | Component  | Description                     |
| ------- | ---------- | ------------------------------- |
| `/`     | `Home.tsx` | Landing page                    |
| `/demo` | `Demo.tsx` | Embedded WebXR AR demo (Jackie) |

---

## 🤝 Team

- Kaylene — Frontend
- Alton — Backend
- Jackie — AR/WebXR + Assets
- Nathan - AR
- Kasper - ML

For issues, open a GitHub issue or tag the team.

---

Happy building! 💄💻✨
