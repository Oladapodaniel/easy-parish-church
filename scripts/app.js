let sideNav = document.querySelector('#side-nav')
sideNav.addEventListener('mouseover', function () {
    let navText = document.querySelectorAll('.nav-text');
    navText.forEach(i => {
        i.style.opacity = '1'
        i.style.transition = 'opacity .5s cubic-bezier(0.165, 0.84, 0.44, 1)'
    })
})

sideNav.addEventListener('mouseout', function () {
    let navText2 = document.querySelectorAll('.nav-text');
    navText2.forEach(i => {
        i.style.opacity = '0'
    })
})