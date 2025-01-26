const login_form = document.getElementById("login_form");
const login_form_html = login_form.innerHTML;
const searchParams = new URLSearchParams(window.location.search);
login_form.innerHTML = '';
let show_login_form = () => {
    login_form.innerHTML = login_form_html;
    login_form.style.position = 'absolute';
    login_form.style.top = '0px';
    login_form.style.bottom = '0px';
    login_form.style.left = '0px';
    login_form.style.right = '0px';
};
if (searchParams.has('login')) {
    show_login_form();
}
