const btn = document.querySelector('button');
const out = document.querySelector('.outer-container-with-menu');

btn.addEventListener('click', buttonPressed);

function buttonPressed(e) {
    out.classList.toggle('active');
}