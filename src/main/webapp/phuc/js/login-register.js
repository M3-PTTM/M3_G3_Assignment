let pass_field = document.querySelector(".pass-key");
let show_btn = document.querySelector(".show");
show_btn.addEventListener("click", function () {
    if (pass_field.type === "password") {
        pass_field.type = "text";
        show_btn.innerHTML = "<em class=\"fa-solid fa-eye-slash\"></em>";
    } else {
        pass_field.type = "password";
        show_btn.innerHTML = "<em class=\"fa-solid fa-eye\"></em>";
    }
});