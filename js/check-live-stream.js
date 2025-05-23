// test.js

// Grab command-line arguments (excluding "node" and the script filename)
const args = process.argv.slice(2);

async function checkIfLive(username) {
  try {
    const response = await fetch(`https://twitch.tv/${username}`);
    const sourceCode = await response.text();

    if (sourceCode.includes("isLiveBroadcast")) {
      console.log(`${username} is live`);
    } else {
      console.log(`${username} is not live`);
    }
  } catch (error) {
    console.log("Error occurred:", error);
  }
}

if (args.length === 0) {
  console.log("No arguments provided. Try running: node test.js arg1 ");
} else {
  // console.log("Arguments received:", args);
  checkIfLive(args[0]);
}
