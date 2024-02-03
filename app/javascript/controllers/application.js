import { Application } from "@hotwired/stimulus";

const application = Application.start();

// Configure Stimulus development experience
application.debug = false;
window.Stimulus = application;

document.addEventListener("DOMContentLoaded", function () {
  const fileInput = document.getElementById("file_input");
  const fileNameDisplay = document.getElementById("file_name");

  fileInput.addEventListener("change", (event) => {
    const fileName = event.target.files[0]?.name;
    fileNameDisplay.textContent = fileName || "No file chosen";
  });
});

export { application };
