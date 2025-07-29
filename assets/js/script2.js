  document.addEventListener("DOMContentLoaded", function() {
    const modal = document.getElementById("imageModal");
    const modalImg = document.getElementById("modalImage");
    const closeModal = document.getElementById("closeModal");
    const projectLinks = document.querySelectorAll(".project-item a");

    projectLinks.forEach(link => {
      link.addEventListener("click", function(e) {
        e.preventDefault();

        const img = this.querySelector("img");
        if (img) {
          modalImg.src = img.src;

          // Show the modal with fade-in
          modal.style.display = "flex";
          requestAnimationFrame(() => {
            modal.style.opacity = "1";
          });
        }
      });
    });

    closeModal.addEventListener("click", () => {
      // Fade out modal
      modal.style.opacity = "0";
      modal.addEventListener("transitionend", hideModal, { once: true });
    });

    modal.addEventListener("click", (e) => {
      if (e.target === modal) {
        // Fade out modal
        modal.style.opacity = "0";
        modal.addEventListener("transitionend", hideModal, { once: true });
      }
    });

    function hideModal() {
      modal.style.display = "none";
    }
  });