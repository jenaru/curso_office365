// back-button.js
// Script para añadir automáticamente el botón de "Volver al menú" a todas las páginas

(function () {
  // Función para crear el botón de volver
  function createBackButton() {
    const button = document.createElement("button");
    button.innerHTML = "Volver al menú";
    button.onclick = function () {
      window.location.href = "../index.html";
    };
    button.style.cssText = `
            position: fixed;
            top: 20px;
            left: 20px;
            padding: 10px 18px;
            background: #3b82f6;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            z-index: 1000;
            font-family: inherit;
            font-size: 14px;
            font-weight: 500;
            transition: background-color 0.2s ease;
        `;

    // Efecto hover
    button.addEventListener("mouseenter", function () {
      this.style.backgroundColor = "#2563eb";
    });

    button.addEventListener("mouseleave", function () {
      this.style.backgroundColor = "#3b82f6";
    });

    return button;
  }

  // Añadir el botón cuando el DOM esté listo
  function addBackButton() {
    // Solo añadir si no estamos en el index principal
    if (
      !window.location.pathname.includes("index.html") &&
      !window.location.pathname.endsWith("/")
    ) {
      const button = createBackButton();
      document.body.appendChild(button);
    }
  }

  // Ejecutar cuando el DOM esté listo
  if (document.readyState === "loading") {
    document.addEventListener("DOMContentLoaded", addBackButton);
  } else {
    addBackButton();
  }
})();
