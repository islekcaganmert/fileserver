from bevyframe import *


def post(context: Context) -> Response:
    email: str = context.form.get('email')
    password: str = context.form.get('password')
    resp = context.start_redirect('/')
    if resp.login(email, password):
        return resp
    else:
        return context.start_redirect('/?login=true')


def get(context: Context) -> Response:
    resp = context.start_redirect('/')
    resp.credentials = {
        'email': f'Guest@{context.app.default_network}',
        'token': ''
    }
    return resp
            