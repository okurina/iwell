const ham= () => {
  const hamburgerMenu = document.querySelector('.hamburger-menu');
  const sideBar = document.querySelector('.side-bar');
  hamburgerMenu.addEventListener('click', () => {
    hamburgerMenu.classList.toggle('active');
    sideBar.classList.toggle('active');
  });
};

window.addEventListener("load", ham);
window.addEventListener("turbo:render", ham);

