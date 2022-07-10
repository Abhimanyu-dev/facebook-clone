// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

function home(){
    const homeBtn = document.querySelector(".title-container")    
    if (homeBtn!=null)
    {
        console.log(homeBtn)
        homeBtn.addEventListener("click", function(){
            // window.localStorage.setItem("activeBtn", "#index")
            var location = window.location.origin + window.localStorage.getItem("activeBtn").replace("#","/")
            window.location.assign(location)
        })
    }
}

function login(){
    const loginBtn = document.querySelector(".actions")
    if (loginBtn!=null)
    {
        console.log(loginBtn)
        loginBtn.addEventListener("click", function(){
            console.log("hi")
            window.onload = () => {
                console.log(window.location)
            }
            const myTimeout = setInterval(() => {
                console.log(window.location)
                if (window.location.href === (window.location.origin+"/"))
                {
                window.location.reload()
                clearInterval(myTimeout)
                }
            }, 1000);
        })
    }
}

// function refresh(){
//     let links = document.querySelector("a")
//     console.log(links)
//     for(let i=0; i<links.length ; i++ )
//     {
//         links[i].addEventListener("click", function(){
//             console.log(this)

//             window.location.reload()
//         })
//     }
// }

function PageTransition(){
    const sectBtns = document.querySelectorAll(".page-control")
    // console.log(sectBtns)

    let flag = true
    var activeBtn = localStorage.getItem("activeBtn")

    // console.log(document.querySelector(activeBtn))
    if (document.querySelector(activeBtn) != null){
    document.querySelector(activeBtn).className += " active"
    }

    for (let i=0; i<sectBtns.length; i++){
        if (sectBtns[i].className.includes("active")){
            flag = false
            break
        }
    }

    if (flag)
    {
        if (document.querySelector("#home") != null) 
        document.querySelector("#home").className += " active"

    }
    for (let i = 0; i < sectBtns.length; i++){
        sectBtns[i].addEventListener("click", function(){
            // console.log(this)
            let currentBtn = document.querySelectorAll(".active");
            // currentBtn[0].className = currentBtn[0].className.replace("active", "")
            // this.className += " active"
            var id = "#"+this.id
            window.localStorage.setItem("activeBtn", id)
            console.log(localStorage.getItem("activeBtn"))
            console.log(window.location)
            var location = window.location.origin + window.localStorage.getItem("activeBtn").replace("#","/")
            window.location.assign(location)
            // refresh()
        })
    }

}

function profileMenu(){
    const profileBtn = document.querySelector(".profile")
    const posts = document.querySelector(".posts")
    // const navbar = document.querySelector(".navbar")
    const menu = document.querySelector(".profile-menu")

    if (profileBtn!= null){
    profileBtn.addEventListener("click", function(){
        if (menu.style.display === "none"){
            menu.style.display = "block";
        }else{
            menu.style.display = "none"
        }
    })

    if (posts != null){
    posts.addEventListener("click", function(){
        if (menu.style.display === "block")
        menu.style.display = "none"
    })
}
}
}
function notificationMenu(){
    const notificationBtn = document.querySelector(".notification")
    const posts = document.querySelector(".posts")
    // const navbar = document.querySelector(".navbar")
    const menu = document.querySelector(".notification-menu")
    console.log (menu)

    if (notificationBtn!= null){
    notificationBtn.addEventListener("click", function(){
        console.log("hi")
        if (menu.style.display === "none"){
            menu.style.display = "block";
        }else{
            menu.style.display = "none"
        }
    })

    if (posts != null){
    posts.addEventListener("click", function(){
        if (menu.style.display === "block")
        menu.style.display = "none"
    })
}
}
}

// function like(){
//     const btn = document.querySelectorAll(".like-btn")
//     for (let i=0; i< btn.length; i++){
//         let current_btn = btn[i]    
//         current_btn.addEventListener("click", function(){
//         if (current_btn.className.includes("liked"))
//             current_btn.className = current_btn.className.replace("liked", "")
//         else
//             current_btn.className += " liked"
//         })
//     }
// }

function new_post(){

    const bar = document.querySelector(".post-creator")
    if (bar != null){
    const poster = document.querySelector(".new-post")
    const homepage = document.querySelector(".homepage")
    const body = document.querySelector("body")
    const close = document.querySelector(".close")
    console.log(poster)
    bar.addEventListener("click", function(){
        if (poster.style.display === "none"){
            poster.style.display = "block"
            console.log(poster.style.display)
            homepage.style.opacity = "0.5"
            poster.style.opacity = "1"
            var btn = document.querySelector('.submit')
            console.log(btn)
            btn.addEventListener("click", function(){
                window.location.reload()    
            })
        }
        else{
            poster.style.display = "none"
            homepage.style.opacity = "1"
        }
    })
    
    // homepage.addEventListener("click", function(){
    //     if (poster.style.display === "block")
    //     {
    //     poster.style.display = "none"
    //     homepage.style.opacity = "1"

    //     }
    // })
    close.addEventListener("click", function(){
        if (poster.style.display === "block"){
            poster.style.display = "none"
            homepage.style.opacity = "1"
            // window.location.reload()

        }
    })
    }
}

function reload(){
    setTimeout(() => {window.location.reload()},1000)
}

function refresh(){
        let links = document.querySelectorAll("a")
        // console.log(links)
        for(let i = 0; i < links.length; i++){
            links[i].addEventListener("click", function(){
                reload()
            })

        }
}
    // PageTransition()
    profileMenu()
    // like()
    new_post()
    home()
    login()
    refresh()
    notificationMenu()