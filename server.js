// Node process wrapper: exists so the Diploi Node.js component (which runs
// `npm start` in production) can launch this repo.
// It does NOT bind $PORT itself; xray (spawned via entrypoint.sh) listens on $PORT.
const { spawn } = require("child_process");
const path = require("path");
const child = spawn("sh", [path.join(__dirname, "entrypoint.sh")], { stdio: "inherit" });
child.on("exit", (code, signal) => {
  console.log(`entrypoint exited code=${code} signal=${signal}`);
  process.exit(code === null ? 1 : code);
});
process.on("SIGTERM", () => child.kill("SIGTERM"));
process.on("SIGINT", () => child.kill("SIGINT"));
