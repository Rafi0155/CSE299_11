const scroll = new LocomotiveScroll({
    el: document.querySelector('#main'),
    smooth: true
});

const mobile_nav = document.querySelector(".mobile-nav-btn");
const nav_container = document.querySelector(".Container");

const toggleNav = () => {
    nav_container.classList.toggle("menu-active");
}

mobile_nav.addEventListener('click', ()=> toggleNav());